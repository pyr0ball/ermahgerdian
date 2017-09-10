# ermahgerdian

1. Clone this project from GIT.

2. Download opencv from
* Homepage: <http://opencv.org>
* Docs: <http://docs.opencv.org/master/>
* Q&A forum: <http://answers.opencv.org>
* Issue tracking: <https://github.com/opencv/opencv/issues>

3. find opencv/build/etc/haarcascades/*.xml files
4. find opencv/build/etc/ibpcascades/*.xml files (example worked with this xml)

5. fix the classpath for opencv libraries.
   5.1 opencv/java/x64/opencv_java330.dll
   5.2 opencv/java/opencv-330.jar

 for intellij:=
 =============
 https://medium.com/@aadimator/how-to-set-up-opencv-in-intellij-idea-6eb103c1d45c

 Note: use this only for setting the classpath for the libraries
 https://intellij-support.jetbrains.com/hc/en-us/community/posts/115000143544-IntelliJ-IDEA-import-OpenCV-Library


 for eclipse:=
 ============
 http://docs.opencv.org/2.4/doc/tutorials/introduction/java_eclipse/java_eclipse.html


After the setup:
 find the FaceDetectionImage.java, which uses lbpcascades/lbpcascade_frontalface.xml to recognize the face.
 right now it can read a file(image) and create a new file(image) with a square around the face.






