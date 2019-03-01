/*********************
  在Qml中显示FFmpeg解码视频
  时间：2018年5月20日15:48:48
  by：池旭超
  Qt_Version:5.7.1
  QQ:120047898
  CSDN:http://blog.csdn.net/cxc233
**********************/
#ifndef XVideoThread_H
#define XVideoThread_H

#include <QThread>
#include "stdint.h"
extern "C"{

#ifdef __cplusplus
 #define __STDC_CONSTANT_MACROS
 #ifdef _STDINT_H
  #undef _STDINT_H
 #endif
 # include <stdint.h>
#endif

}
extern "C"
{

#include "libavformat/avformat.h"
#include "libavutil/mathematics.h"
#include "libavutil/time.h"
#include "libswscale/swscale.h"
}
class XVideoThread : public QThread
{
    Q_OBJECT
public:
    XVideoThread();
    ~XVideoThread();
    std::string strPath() const;
    void setStrPath(const std::string &strPath);
    void stop();

private:
    void init();
    void unInit();
    void run();

    uint8_t *m_pOutBuf;
    AVFrame *m_pFrame;
    AVFrame *m_pFrameRGB;
    AVCodecContext  *m_pCodecCtx;
    AVFormatContext *m_pInFmtCtx;
    AVCodec         *m_pCodec;
    AVPacket        *m_pPacket;
    std::string m_strPath;

signals:

    void sig_SendOneFrame(QImage *pImage);
};

#endif // XVideoThread_H
