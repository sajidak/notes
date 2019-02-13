## Buffer 1812
> from mobile

## AYATH
nafs ki haqeeqat full 16:19

## Canon
-  EOS 800D
-  EOS 200D
-  EOS 1500D
-  EOS 3000D

| Lens       | Aperture          | Dia  |      MRP |
| :--------- | :---------------- | :--- | -------: |
| EF24-70mm  | f/2.8L II USM     | 82mm | 1,42,995 |
| EF24-105mm | f/4L IS II USM    | 77mm |   83,995 |
| EF24-70mm  | f/4L IS USM       | 77mm |   80,995 |
| EF24-105mm | f/3.5-5.6 IS STM  | 77mm |   33,595 |
| EF28-300mm | f/3.5-5.6L IS USM | 77mm | 1,75,995 |


### Interesting Cameras
- Canon PowerShot G9 X Mark II

## ffmpeg
- https://gist.github.com/protrolium/e0dbd4bb0f1a396fcb55
  - ffmpeg -i video.avi
  - ffmpeg -formats
  - ffmpeg -i INPUT.mp4 -codec copy -an OUTPUT.mp4
  - ffmpeg -i videofile.mp4 -vn -acodec libvorbis audiofile.ogg
  
## mp3
- http://docs.puddletag.net/download.html
- https://wiki.gnome.org/Apps/EasyTAG
- https://kid3.sourceforge.io

## Darbuka
- https://youtu.be/md_CqRqH6zQ
- https://youtu.be/PVgOmklK4BY
- https://youtu.be/K6-wt-4M7ok

- sPV5FzEUWnQ
- https://www.youtube.com/watch?v=YkLKhKT8X6I&list=RDQMc7r_anOE4ek
- 1LeDbH-w0cc aYhhvBwjU8RZ4yXO
- https://youtu.be/ThWI1mNM32s
- https://youtu.be/md_CqRqH6zQ
- https://youtu.be/Q4MTKsgW4-8
- bits
  - https://youtu.be/eFhcogOmFds
  - https://youtu.be/ZOC8dE9pppU
  
## Image resize or thumbnail
- https://docs.microsoft.com/en-us/dotnet/api/system.drawing.image.getthumbnailimage
- https://docs.microsoft.com/en-us/dotnet/api/system.drawing.image?view=netcore-2.1
- https://docs.microsoft.com/en-us/dotnet/api/system.drawing.bitmap?view=netcore-2.1
  - https://docs.microsoft.com/en-us/dotnet/api/system.drawing.bitmap.-ctor?view=netcore-2.1#System_Drawing_Bitmap__ctor_System_Drawing_Image_System_Int32_System_Int32_


```cs
// e.g. 00 ********************************************************************/
public static Image resizeImage(Image imgToResize, Size size)
    {
       return (Image)(new Bitmap(imgToResize, size));
    }

    yourImage = resizeImage(yourImage, new Size(50,50));
    
// e.g. 01 ********************************************************************/
public static Image resizeImage(Image image, int new_height, int new_width)
{
    Bitmap new_image = new Bitmap(new_width, new_height);
    Graphics g = Graphics.FromImage((Image)new_image );
    g.InterpolationMode = InterpolationMode.High;
    g.DrawImage(image, 0, 0, new_width, new_height);
    return new_image;
}    
    
// e.g. 02 ********************************************************************/
public string CreateThumbnail(int maxWidth, int maxHeight, string path)
{
    var image = System.Drawing.Image.FromFile(path);
    var ratioX = (double)maxWidth / image.Width;
    var ratioY = (double)maxHeight / image.Height;
    var ratio = Math.Min(ratioX, ratioY);
    var newWidth = (int)(image.Width * ratio);
    var newHeight = (int)(image.Height * ratio);
    var newImage = new Bitmap(newWidth, newHeight);
    Graphics thumbGraph = Graphics.FromImage(newImage);

    thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
    thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
    //thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;

    thumbGraph.DrawImage(image, 0, 0, newWidth, newHeight);
    image.Dispose();

    string fileRelativePath = "newsizeimages/" + maxWidth + Path.GetFileName(path);
    newImage.Save(Server.MapPath(fileRelativePath), newImage.RawFormat);
    return fileRelativePath;
}
    
    
// e.g. 1  ********************************************************************/
Image originalImage = System.Drawing.Image.FromStream(inputStream, true, true);
Image resizedImage = originalImage.GetThumbnailImage(newWidth, (newWidth * originalImage.Height) / originalWidth, null, IntPtr.Zero);
resizedImage.Save(imagePath, ImageFormat.Png);

// e.g. 2  ********************************************************************/
public bool ThumbnailCallback()
{
    return false;
}
public void Example_GetThumb(PaintEventArgs e)
{
    Image.GetThumbnailImageAbort myCallback =
    new Image.GetThumbnailImageAbort(ThumbnailCallback);
    Bitmap myBitmap = new Bitmap("Climber.jpg");
    Image myThumbnail = myBitmap.GetThumbnailImage(
    40, 40, myCallback, IntPtr.Zero);
    e.Graphics.DrawImage(myThumbnail, 150, 75);
}

```

## Imagemagick pipelines
- https://stackoverflow.com/questions/29736137/imagemagick-multiple-operations-in-single-invocation
 
