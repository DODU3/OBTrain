#include "systemopen.h"
#include<iostream>
#include <qdir.h>
#include <qprocess.h>
#include <QDesktopServices>
#include <qurl.h>
#include <QCoreApplication>
systemOpen::systemOpen()
{

}

void systemOpen::openProject()
{
    system("C:/Users/admin/Desktop/Magnetometer/Drone_Templates/Projects/Project.uvprojx");
}

void systemOpen::openMagPresent()
{
    system("C:/Users/admin/Desktop/magPresent.ppt");
}


void systemOpen::openMagFlow()
{
    system("C:/Users/admin/Desktop/magFlow.ppt");
}

void systemOpen::openFaceDet()
{
    system("C:/Users/Administrator/Desktop/dlibResNet_DBW/FaceDet.py");
}

void systemOpen::openFaceRec()
{
    system("C:/Users/Administrator/Desktop/dlibResNet_DBW/FaceRec.py");
}
void systemOpen::openKCF()
{
    system("D:/On-Bright/Tracking/KCF_UAV.exe");
}

void systemOpen::openHuman()
{
    system("D:/On-Bright/Platform/TensorFlow_test/x64/Release/TensorFlow_test.exe");
}

void systemOpen::openPosture()
{
    system("python D:/On-Bright/Posture/inceptionv1_opencv_predict.py");
}
void systemOpen::openFile(QString relative_path)
{
     QString path = QCoreApplication::applicationDirPath();
//     path += "/Content resource/磁力计模组/教学资料/教学PPT/磁力计模组PPT.ppt";
     path += relative_path;
     path.replace("/","\\");//将地址中的"/"替换为"\"，因为在Windows下使用的是"\"。
     QProcess::startDetached("explorer "+path);//打开上面获取的目录


//                    QString local_path = QString("D:\Qt\project\Test1\obtRAIN\Content resource\磁力计模组\教学资料\教学PPT\磁力计模组PPT"); //a.txt、a.exe、a.mp3、a.mp4、a.rmvb等
//                    QString path = QString("file:///") + local_path;
//                    QDesktopServices::openUrl(QUrl(path, QUrl::TolerantMode));

//                    QString local_path = QString("E:/新建文件夹"); //a.txt、a.exe、a.mp3、a.mp4、a.rmvb等
//                    QString path = QString("file:///") + local_path;
//                    bool is_open = QDesktopServices::openUrl(QUrl(path, QUrl::TolerantMode));
}


