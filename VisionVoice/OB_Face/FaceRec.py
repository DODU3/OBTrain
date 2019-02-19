import face_recognition
import cv2
import os
import sys
import numpy as np
import time
from PIL import Image
#from readData import *


def face_rec():
    # Get a reference to webcam #0 (the default one)
    current_path = os.getcwd()
    data_path = current_path + "/image/"
    video_path = current_path + "/video/"
    save_path = current_path + "/save/"
    print(current_path)
	
	
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
	
	
    video_capture = cv2.VideoCapture(0)
    #video_capture = cv2.VideoCapture(video_path + "2.mp4")

    # Initialize some variables
    face_locations = []
    face_encodings = []
    face_names = []
    process_this_frame = True
    start_time = time.time()
    counter = 0
    multi = 0.5
    while True:
        # Grab a single frame of video
        ret, frame = video_capture.read()
        
        frame = np.uint8(np.clip((1.25 * frame + 10), 0, 255))
        # Resize frame of video to 1/4 size for faster face recognition processing
        #print(frame.shape)
        small_frame = cv2.resize(frame, (0, 0), fx = multi, fy = multi)

        # Convert the image from BGR color (which OpenCV uses) to RGB color (which face_recognition uses)
        rgb_small_frame = small_frame[:, :, ::-1]
        # rgb_small_frame = frame[:, :, ::-1]

        # Only process every other frame of video to save time
        if process_this_frame:
            # Find all the faces and face encodings in the current frame of video
            face_locations = face_recognition.face_locations(rgb_small_frame)
            face_encodings = face_recognition.face_encodings(rgb_small_frame, face_locations)

            face_names = []
            for face_encoding in face_encodings:
                # See if the face is a match for the known face(s)
                matches = face_recognition.compare_faces(known_face_encodings, face_encoding, tolerance=0.42)
                name = "Unknown"
                # If a match was found in known_face_encodings, just use the first one.
                if True in matches:
                    first_match_index = matches.index(True)
                    name = known_face_names[first_match_index]

                face_names.append(name)

        process_this_frame = not process_this_frame


        # Display the results
        for (top, right, bottom, left), name in zip(face_locations, face_names):
            # Scale back up face locations since the frame we detected in was scaled to 1/4 size
            top = int(top / multi)
            right = int(right / multi)
            bottom = int(bottom / multi)
            left = int(left / multi)

            # Draw a box around the face
            cv2.rectangle(frame, (left, top), (right, bottom), (0, 255, 0), 2)

            # Draw a label with a name below the face
            cv2.rectangle(frame, (left, bottom + 35), (right, bottom), (0, 255, 0), cv2.FILLED)
            #font = cv2.FONT_HERSHEY_DUPLEX
            #cv2.putText(frame, name, (left + 6, bottom - 6), font, 1.0, (255, 255, 255), 1)
            cv2.putText(frame, name, (left, bottom + 25), cv2.FONT_HERSHEY_SIMPLEX, 1, (0,0,255), 2)

        # Display the resulting image
        counter += 1
        fps = counter / (time.time() - start_time)
        #float('%.2f' % fps)
        fps = "%.2f" % fps
        cv2.putText(frame, "FPS: {0}" .format(str(fps)), (0, 25), 2, 1, (0, 0, 255), 1)
        cv2.imshow('Video', frame)
        cv_bgr_image = cv2.cvtColor(frame, cv2.COLOR_RGB2BGR)
        # Hit 'q' on the keyboard to quit!
        #if cv2.waitKey(1) & 0xFF == ord('q'):
            #break
        if cv2.waitKey(1) & 0xFF == ord('c'):
            img_name = os.path.join(save_path, str(counter)) + '.jpg'
            cv2.imwrite(img_name, frame)
            continue
    # Release handle to the webcam
    video_capture.release()
    cv2.destroyAllWindows()

if __name__ == "__main__":
    face_rec()
