void setup() {
  background(0, 0, 204);

  size(700, 700);

  // left ear
  fill(255, 228, 181);
  ellipse(190, 295, 35, 75);

  // right ear
  fill(255, 228, 181);
  ellipse(510, 295, 35, 75);

  // left piercing
  fill(128, 128, 128);
  ellipse(188, 330, 10, 10);
  ellipse(188, 340, 10, 10);
  ellipse(188, 350, 10, 10);
  ellipse(188, 360, 10, 10);

  // right piercing
  fill(128, 128, 128);
  ellipse(512, 335, 23, 23);
  fill(255, 255, 255);
  ellipse(512, 335, 10, 10);

  // face
  fill(255, 228, 181);
  ellipse(350, 310, 300, 350);

  // left eye
  fill(255, 255, 255);
  ellipse(285, 280, 75, 35);

  // right eye
  fill(255, 255, 255);
  ellipse(415, 280, 75, 35);

  // left pupil
  fill(139, 69, 19);
  ellipse(290, 280, 35, 35);

  // right pupil
  fill(139, 69, 19);
  ellipse(410, 280, 35, 35);

  //nose 
  fill(0, 0, 0);
  line(350, 312, 375, 363);
  line(375, 363, 350, 363);

  // mouth
  fill(204, 0, 0);
  curve(155, -40, 400, 390, 300, 390, 235, -40);

  // cap 
  fill(0, 0, 0);
  rect(214, 207, 400, 30);
  fill(0, 0, 0);
  curve(150, 700, 490, 208, 215, 208, 100, 1000);

  // left eyebrow
  curve(140, 400, 248, 254, 320, 254, 205, 220);

  // right eyebrow
  curve(155, 400, 376, 254, 452, 254, 235, 200);
}
