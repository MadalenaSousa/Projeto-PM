class NivelSimples extends Jogo {

  int nLimite;
  ArrayList <Integer> recorde;

  NivelSimples(int n, int m, PImage img, int alturaImg, int larguraImg, Status status, int nBaralhar, int nLimite) {
    super(n, m, img, alturaImg, larguraImg, status, nBaralhar);
    this.nLimite = nLimite;
    recorde = new ArrayList();
  }

  void startNivel() {
    moveBaralhar.clear(); //Limpa o array com os movimentos de baralhar
    misturar(); //Baralha
    moveJogador.clear(); //Limpa o array com os movimentos do jogador para poder voltar a jogar
    jaGanhou = false; //Garante que as variaveis que dizem se já perdeu ou ganhou o jogo estão a falso
    jaPerdeu = false;
  }
  
  //Estrutura geral do nível + Pontuação
  void desenhaJogo() {
    super.desenha();

    textAlign(CENTER, CENTER);
    fill(255);
    textSize(30);
    text("Jogadas Disponíveis", 800, 300);
    textSize(50);
    text(nLimite - moveJogador.size(), 800, 400);
    textSize(30);
    text("Recorde", 800, 500);
    textSize(50);
    text(recorde(), 800, 600);

  }

  //Determina se, consoante o numero de jogadas feitas, é ainda permitido jogar (tecnicamente, diz-nos se o jogar já perdeu ou não)
  boolean permiteJogar() {
    if (moveJogador.size() < nLimite) {
      return true;
    } else {
      return false;
    }
  }

  String recorde() {
    if (jaGanhou) {
      recorde.add(moveJogador.size());
    }
    if(recorde.size() == 0) {
      return "";
    }
    int[] rec = new int[recorde.size()]; 
    for(int i = 0; i < recorde.size(); i++) {
      rec[i] = recorde.get(i);
    }
    return "" + min(rec);
  }
}
