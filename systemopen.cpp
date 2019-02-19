#include "systemopen.h"
#include<iostream>

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

void systemOpen::openFaceDBW()
{
    system("D:/QTDev/OBTrainDev/OBTrain/VisionVoice/OB_Face/FaceRec.py");
}

