<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Untuk Cintaku</title>
<style>
  /* --- Font & General Styling --- */
  @font-face {
    font-family: 'SF Pro Display';
    src: url('https://raw.githubusercontent.com/sahibjotsingh/Apple-SF-Pro-Font-Family/master/SF-Pro-Display-Bold.otf') format('opentype');
    font-weight: bold;
  }

  @font-face {
    font-family: 'SF Pro Display';
    src: url('https://raw.githubusercontent.com/sahibjotsingh/Apple-SF-Pro-Font-Family/master/SF-Pro-Display-Regular.otf') format('opentype');
    font-weight: normal;
  }

  body {
    margin: 0;
    overflow: hidden;
    font-family: 'SF Pro Display', sans-serif;
    background-color: #ffc0cb; /* Pink background */
    color: #fff;
    text-align: center;
    cursor: pointer;
  }

  .slide {
    display: none;
    position: absolute;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    box-sizing: border-box;
    padding: 20px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    transition: opacity 0.5s ease-in-out;
  }

  .slide.active {
    display: flex;
  }
  
  /* --- Slide 1 & 2 Styling --- */
  .slide h1 {
    font-size: 3em;
    font-weight: bold;
    text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
  }

  /* --- Slide 3 Styling --- */
  #slide3-content {
    position: relative;
    width: 90%;
    height: 90%;
    overflow: hidden;
    padding: 20px;
    background: rgba(255, 255, 255, 0.3);
    border-radius: 20px;
    backdrop-filter: blur(10px);
  }

  #typed-text {
    font-size: 1.5em;
    font-weight: normal;
    text-align: left;
    white-space: pre-wrap;
    overflow: hidden;
    line-height: 1.6;
    letter-spacing: 0.5px;
    padding: 10px;
    max-height: 100%;
    overflow-y: auto;
  }

  /* --- Love Rain Animation --- */
  .love-rain-container {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    overflow: hidden;
    pointer-events: none;
  }
  .love {
    position: absolute;
    color: #ff69b4; /* Hot pink */
    font-size: 2em;
    animation: fall linear infinite;
    opacity: 0;
  }
  @keyframes fall {
    0% { transform: translateY(-100%); opacity: 1; }
    100% { transform: translateY(100vh); opacity: 0; }
  }

  /* --- Slide 4 Styling --- */
  #slide4 .love-beat {
    font-size: 15em;
    color: #ff1493; /* Deep pink */
    animation: heartBeat 1.5s infinite;
    text-shadow: 0 0 20px rgba(255, 20, 147, 0.8);
  }
  @keyframes heartBeat {
    0% { transform: scale(1); }
    50% { transform: scale(1.1); }
    100% { transform: scale(1); }
  }
  #slide4 p {
    font-size: 2.5em;
    font-weight: bold;
    margin-top: 20px;
    text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
  }
</style>
</head>
<body>

  <div id="slide1" class="slide active">
    <h1>tap di mana aja sayang</h1>
  </div>

  <div id="slide2" class="slide">
    <h1>tap sekali lagi hihi becanda dikit kalii yeeee caca aku yang cantik</h1>
  </div>

  <div id="slide3" class="slide">
    <div class="love-rain-container"></div>
    <div id="slide3-content">
      <p id="typed-text"></p>
    </div>
    <audio id="bg-audio" loop>
      <source src="https://raw.githubusercontent.com/aji-permana-developer/public-assets/main/lagu-untuk-mencintaimu.mp3" type="audio/mpeg">
      Your browser does not support the audio element.
    </audio>
  </div>

  <div id="slide4" class="slide">
    <span class="love-beat">❤️</span>
    <p>i love u cinderellaku</p>
  </div>

  <script>
    document.addEventListener('DOMContentLoaded', () => {
      const slides = document.querySelectorAll('.slide');
      let currentSlide = 0;
      const audio = document.getElementById('bg-audio');

      // Slide 3-specific elements
      const typedTextElement = document.getElementById('typed-text');
      const loveRainContainer = document.querySelector('.love-rain-container');
      const slide3Text = `meski jarak memisahkan dan waktu terasa begitu lama, tetaplah jaga hati dan kesehatan, karena pertemuan indah nanti akan terasa lebih berharga ketika kita sama-sama kuat dan tegar. jangan biarkan rindu membuatmu lelah, tetapi biarkan ia menjadi penguat bahwa cinta ini mampu bertahan melewati jarak. tetap semangat, makan teratur, istirahat cukup, dan ingatlah bahwa di ujung penantian ini ada aku yang selalu mendoakanmu sehat, bahagia, dan tersenyum saat akhirnya kita bertemu wahai cinderellaku ariska yang cantik.
walau tak bisa menggenggam tanganmu saat ini, percayalah setiap detik hatiku selalu mengarah kepadamu. kita mungkin jauh, tapi rasa sayang ini tak pernah mengenal jarak. aku akan terus menjaga hatiku untukmu, merangkai doa di setiap malam agar kamu selalu dilindungi, dijaga kesehatannya, dan diselimuti kebahagiaan. sampai tiba saatnya kita duduk berdampingan, saling menatap mata penuh cinta, dan tahu bahwa semua penantian ini tidak pernah sia-sia. _ Aji - tap lagi`;
      
      let typingInterval;
      let loveRainInterval;

      function showSlide(index) {
        slides.forEach((slide, i) => {
          slide.classList.remove('active');
          if (i === index) {
            slide.classList.add('active');
          }
        });
      }

      function transitionToNextSlide() {
        if (currentSlide < slides.length - 1) {
          currentSlide++;
          showSlide(currentSlide);
          handleSlideSpecificActions(currentSlide);
        }
      }

      function handleSlideSpecificActions(slideIndex) {
        // Clear previous intervals/audio
        clearInterval(typingInterval);
        clearInterval(loveRainInterval);
        if (audio) {
          audio.pause();
          audio.currentTime = 0;
        }

        if (slideIndex === 2) { // Slide 3
          startTypingAnimation(typedTextElement, slide3Text);
          startLoveRainAnimation();
          if (audio) {
            audio.play().catch(error => console.log('Audio playback failed:', error));
          }
        }
      }

      // Typing animation for slide 3
      function startTypingAnimation(element, text) {
        let i = 0;
        element.innerHTML = '';
        typingInterval = setInterval(() => {
          if (i < text.length) {
            element.innerHTML += text.charAt(i);
            element.scrollTop = element.scrollHeight; // Auto-scroll
            i++;
          } else {
            clearInterval(typingInterval);
          }
        }, 50); // Adjust typing speed here
      }

      // Love rain animation for slide 3
      function startLoveRainAnimation() {
        loveRainInterval = setInterval(() => {
          const love = document.createElement('span');
          love.classList.add('love');
          love.innerHTML = '❤️';
          love.style.left = Math.random() * 100 + 'vw';
          love.style.animationDuration = Math.random() * 2 + 3 + 's';
          love.style.fontSize = Math.random() * 2 + 1 + 'em';
          loveRainContainer.appendChild(love);

          setTimeout(() => {
            love.remove();
          }, 5000); // Remove love after it falls
        }, 100); // Adjust frequency of love hearts
      }

      // Main event listener for all slides
      document.body.addEventListener('click', () => {
        transitionToNextSlide();
      });

      showSlide(currentSlide);
    });
  </script>

</body>
</html>
