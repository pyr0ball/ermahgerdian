package com.opencv.facedetect;

import org.opencv.core.Core;
import org.opencv.core.Mat;
import org.opencv.core.MatOfRect;
import org.opencv.core.Point;
import org.opencv.core.Rect;
import org.opencv.core.Scalar;

import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.imgproc.Imgproc;
import org.opencv.objdetect.CascadeClassifier;

public class FaceDetectionImage {
    public static void main (String[] args) {
        // Loading the OpenCV core library
        System.loadLibrary( Core.NATIVE_LIBRARY_NAME );

        // Reading the Image from the file and storing it in to a Matrix object
        //String file ="E:/OpenCV/chap23/facedetection_input.jpg";
        String file = "C:/Dev/projects/hackathon/facedetector/src/main/resources/photo/shekhar.JPG";
        Mat src = Imgcodecs.imread(file);

        // Instantiating the CascadeClassifier
        //String xmlFile = "lbpcascades/lbpcascade_frontalface.xml";

        String xmlFile = "C:/Dev/projects/hackathon/facedetector/src/main/resources/lbpcascades/lbpcascade_frontalface.xml";
        CascadeClassifier classifier = new CascadeClassifier(xmlFile);

        // Detecting the face in the snap
        MatOfRect faceDetections = new MatOfRect();
        classifier.detectMultiScale(src, faceDetections);
        System.out.println(String.format("Detected %s faces",
                faceDetections.toArray().length));

        // Drawing boxes
        for (Rect rect : faceDetections.toArray()) {
            Imgproc.rectangle(
                    src,                                               // where to draw the box
                    new Point(rect.x, rect.y),                            // bottom left
                    new Point(rect.x + rect.width, rect.y + rect.height), // top right
                    new Scalar(0, 0, 255),
                    3                                                     // RGB colour
            );
        }

        //
        String output = "C:/Dev/projects/hackathon/facedetector/src/main/resources/photo/shekhar1.JPG";
        // Writing the image
        Imgcodecs.imwrite(output, src);

        System.out.println("Image Processed");
    }
}