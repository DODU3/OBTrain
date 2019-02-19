
import cv2
import os
import numpy as np

current_path = os.getcwd()
data_path = current_path + "/image/"


known_face_names = []
with open('facename.txt','r') as f:
    for line in f:
        #kn.append(line.strip('\n').split())
        known_face_names.append(line.strip('\n'))

kf = []
with open('facedata.txt','r') as f:
    for line in f:
        kf.append(line.strip('\n').split())
known_face_encodings = []
for arr in kf:
    arr = (list(map(eval,arr)))
    known_face_encodings.append(arr)

#print(known_face_encodings)
#print(type(known_face_encodings))
#known_face_encodings = known_face_encodings(list(map(eval,known_face_encodings)))
#print(type(known_face_encodings))
#print(known_face_encodings)

#print(type(known_face_encodings))
#print(known_face_encodings)

