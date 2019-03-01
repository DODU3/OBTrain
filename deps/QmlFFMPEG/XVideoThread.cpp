#include "XVideoThread.h"
#include <QImage>
#include <QDebug>

XVideoThread::XVideoThread()
{
    this->init();
}

XVideoThread::~XVideoThread()
{
    requestInterruption();
    quit();
    wait();
    this->unInit();
}

void XVideoThread::init()
{
    av_register_all();
    avformat_network_init();
}

void XVideoThread::stop()
{
    requestInterruption();
    quit();
    wait();
}

void XVideoThread::unInit()
{
    qDebug()<<"ffmpeg uninit";
    av_free(m_pOutBuf);
    av_free(m_pFrameRGB);
    av_free(m_pFrame);
    av_free(m_pCodec);
    avcodec_close(m_pCodecCtx);
    avformat_close_input(&m_pInFmtCtx);
}

void XVideoThread::run()
{
    m_pInFmtCtx = avformat_alloc_context();
    if(avformat_open_input(&m_pInFmtCtx, m_strPath.c_str(), NULL, NULL))
    {
        qDebug()<<"get rtsp failed";
        return;
    }
    else
    {
        qDebug()<<"get rtsp success";
    }
    if(avformat_find_stream_info(m_pInFmtCtx, NULL) < 0)
    {
        qDebug()<<"could not find stream information";
        return;
    }
    int nVideoIndex = -1;
    for(int i = 0; i < m_pInFmtCtx->nb_streams; i++)
    {
        if(m_pInFmtCtx->streams[i]->codec->codec_type == AVMEDIA_TYPE_VIDEO)
        {
            nVideoIndex = i;
            break;
        }
    }
    if(nVideoIndex == -1)
    {
        qDebug()<<"could not find video stream";
        return;
    }
    //Output Info---输出一些信息
    qDebug("---------------- File Information ---------------");
    //av_dump_format(m_pInFmtCtx, 0, m_strPath.c_str(), 0);
    m_pCodecCtx = m_pInFmtCtx->streams[nVideoIndex]->codec;
    m_pCodec = avcodec_find_decoder(m_pCodecCtx->codec_id);
    if(!m_pCodec)
    {
        qDebug()<<"could not find codec";
        return;
    }
    if (avcodec_open2(m_pCodecCtx, m_pCodec, NULL) < 0) {
        qDebug("Could not open codec.\n");
        return;
    }
    m_pFrame     = av_frame_alloc();
    m_pFrameRGB  = av_frame_alloc();
    m_pOutBuf = (uint8_t*)av_malloc(avpicture_get_size(AV_PIX_FMT_RGB32, m_pCodecCtx->width, m_pCodecCtx->height));
    avpicture_fill((AVPicture*)m_pFrameRGB, m_pOutBuf, AV_PIX_FMT_RGB32, m_pCodecCtx->width, m_pCodecCtx->height);


    struct SwsContext *pImgCtx = sws_getContext(m_pCodecCtx->width, m_pCodecCtx->height, m_pCodecCtx->pix_fmt,
                                                m_pCodecCtx->width, m_pCodecCtx->height, AV_PIX_FMT_RGB32, SWS_BICUBIC, NULL, NULL, NULL);
    int nSize = m_pCodecCtx->width * m_pCodecCtx->height;
    m_pPacket = (AVPacket *)av_malloc(sizeof(AVPacket));
    if(av_new_packet(m_pPacket, nSize) != 0)
    {
        qDebug()<<"new packet failed";
    }

    while (!isInterruptionRequested())
    {
        if(av_read_frame(m_pInFmtCtx, m_pPacket) >= 0)
        {
            if(m_pPacket->stream_index == nVideoIndex)
            {
                int nGotPic = 0;
                if(avcodec_decode_video2(m_pCodecCtx, m_pFrame, &nGotPic, m_pPacket) < 0)
                {
                    qDebug()<<"decode failed";
                    return;
                }
                if(nGotPic)
                {
                    sws_scale(pImgCtx, (const uint8_t* const*)m_pFrame->data,
                              m_pFrame->linesize, 0, m_pCodecCtx->height, m_pFrameRGB->data,
                              m_pFrameRGB->linesize);
                    QImage *pImage = new QImage((uchar*)m_pOutBuf, m_pCodecCtx->width, m_pCodecCtx->height, QImage::Format_RGB32);
                   // pImage->save("c://test.png", "PNG", 50);
                    emit sig_SendOneFrame(pImage);
                }
            }
        }
        av_free_packet(m_pPacket);
        msleep(5);
    }
    exec();
}

std::string XVideoThread::strPath() const
{
    return m_strPath;
}

void XVideoThread::setStrPath(const std::string &strPath)
{
    m_strPath = strPath;
}
