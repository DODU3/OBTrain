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
     path += relative_path;
     path.replace("/","\\");//将地址中的"/"替换为"\"，因为在Windows下使用的是"\"。
     QProcess::startDetached("explorer "+path);//打开上面获取的目录
}


