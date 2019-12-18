console.log("asdfqfa");
      function displayNextImage() {
    if(i === cookieImages.length - 1) {i = 0} else {  i = i + 1};
          document.getElementById("cookieImg").src = cookieImages[i];
          document.getElementById("cakeImg").src = cakeImages[i];
          document.getElementById("muffinImg").src = muffinImages[i];
      }

      function displayPreviousImage() {
          x = (x <= 0) ? cookieImages.length - 1 : i - 1;
          document.getElementById("cookieImg").src = cookieImages[i];
          document.getElementById("cakeImg").src = cookieImages[i];
          document.getElementById("muffinImg").src = muffinImages[i];
      }

      function startTimer() {
          setInterval(displayNextImage, 3000);
      }

      var cookieImages = [], i = -1;
      cookieImages[0] = "images/cookie1.jpeg";
      cookieImages[1] = "images/cookie2.jpeg";
      cookieImages[2] = "images/cookie3.jpg";

      var cakeImages = []
      cakeImages[0] = "images/cake1.jpeg";
      cakeImages[1] = "images/cake2.jpeg";
      cakeImages[2] = "images/cake3.jpeg";

      var muffinImages = []
      muffinImages[0] = "images/muffin1.jpeg";
      muffinImages[1] = "images/muffin2.jpeg";
      muffinImages[2] = "images/muffin3.jpeg";
startTimer()
