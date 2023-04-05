<!DOCTYPE html>
<html>
<head>
	<title>Dino Game</title>
	<style type="text/css">
		body {
			background-color: #f7f7f7;
		}
		#container {
			margin: 0 auto;
			width: 500px;
			height: 300px;
			position: relative;
			border: 1px solid #333;
			background-color: #fff;
		}
		#dino {
			position: absolute;
			bottom: 0px;
			left: 20px;
			width: 50px;
			height: 50px;
			background-image: url('https://raw.githubusercontent.com/marychellecarreon/dino-game/main/dino.png');
			background-size: 100%;
		}
		#cactus {
			position: absolute;
			bottom: 0px;
			right: 20px;
			width: 50px;
			height: 50px;
			background-image: url('https://raw.githubusercontent.com/marychellecarreon/dino-game/main/cactus.png');
			background-size: 100%;
		}
	</style>
</head>
<body>
	<div id="container">
		<div id="dino"></div>
		<div id="cactus"></div>
	</div>

	<script type="text/javascript">
		var dino = document.getElementById('dino');
		var cactus = document.getElementById('cactus');

		var jump = function() {
			dino.classList.add('jump');
			setTimeout(function(){
				dino.classList.remove('jump');
			}, 1000);
		}

		document.addEventListener('keydown', function(event){
			if (event.code == 'Space') {
				jump();
			}
		});

		var cactusPosition = 500;
		var score = 0;
		var speed = 10;

		var moveCactus = function() {
			cactusPosition -= speed;
			cactus.style.right = cactusPosition + 'px';

			if (cactusPosition < 0) {
				cactusPosition = 500;
				score++;
			}

			if (isColliding(dino, cactus)) {
				alert('Game Over! Your score is: ' + score);
				location.reload();
			}
		}

		var isColliding = function(a, b) {
			var aRect = a.getBoundingClientRect();
			var bRect = b.getBoundingClientRect();

			return !(
				(aRect.bottom < bRect.top) || 
				(aRect.top > bRect.bottom) || 
				(aRect.right < bRect.left) || 
				(aRect.left > bRect.right)
			);
		}

		setInterval(moveCactus, 20);
	</script>
</body>
</html>
