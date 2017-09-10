package com.opencv.facedetect;

import org.opencv.core.*;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.imgproc.Imgproc;
import org.opencv.objdetect.CascadeClassifier;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main(String[] args){
        System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
        Mat mat = Mat.eye(3, 3, CvType.CV_8UC1);
        System.out.println("mat = " + mat.dump());

        System.out.println(" URL for "+App.class.getResource("/haarcascades/haarcascade_frontalface_alt.xml"));
        System.out.println(" URL for "+App.class.getClassLoader().getResource("haarcascades/haarcascade_frontalface_alt.xml").getPath());

        CascadeClassifier faceDetector = new CascadeClassifier(App.class.getResource("/haarcascades/haarcascade_frontalface_alt.xml").getPath());
        System.out.println("flag here >>> "+faceDetector.load(App.class.getClassLoader().getResource("haarcascades/haarcascade_frontalface_alt.xml").getPath()));
        Mat image = Imgcodecs.imread(App.class.getResource("/photo/shekhar.JPG").getPath());
        System.out.println("image >>>> "+image);
        System.out.println(" path >>> "+faceDetector.load(App.class.getResource("/photo/shekhar.JPG").getPath()));

        //CascadeClassifier faceDetector = new CascadeClassifier(FaceDetector.class.getResource("/haarcascade_frontalface_alt.xml").getPath());
        //Mat image = Imgcodecs.imread(FaceDetector.class.getResource("shekhar.JPG").getPath());

        //Highgui
        //      .imread(FaceDetector.class.getResource("shekhar.JPG").getPath());

        MatOfRect faceDetections = new MatOfRect();
        faceDetector.detectMultiScale(image, faceDetections);

        System.out.println(String.format("Detected %s faces", faceDetections.toArray().length));

        for (Rect rect : faceDetections.toArray()) {

            Imgproc.rectangle(image, new Point(rect.x, rect.y), new Point(rect.x + rect.width, rect.y + rect.height),
                    new Scalar(0, 255, 0));
            //Core.rectangle(image, new Point(rect.x, rect.y), new Point(rect.x + rect.width, rect.y + rect.height),
              //      new Scalar(0, 255, 0));
        }

        String filename = "ouput.png";
        System.out.println(String.format("Writing %s", filename));
        Imgcodecs.imwrite(filename, image);

    }
}
