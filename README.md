# Calculadora de IMC - Flutter 📱⚖️

Um aplicativo mobile simples e intuitivo para o cálculo do Índice de Massa Corporal (IMC), desenvolvido inteiramente em Flutter.

Este projeto foi construído como parte das entregas de um curso de desenvolvimento mobile. Ele representa o próximo passo na evolução do aprendizado: pegando a lógica matemática e as regras de negócio de um cálculo de IMC — antes rodando apenas via terminal em Dart puro — e aplicando-as em uma interface gráfica interativa, amigável e com feedback visual em tempo real para o usuário. Agora, com persistência de dados local, o aplicativo também permite que você armazene e consulte seu histórico de medições.

## 🚀 Funcionalidades

* **Entrada de Dados:** Campos de texto com teclado numérico otimizado para inserção de Peso (kg) e Altura (cm/m).
* **Cálculo Imediato:** Processamento do IMC ao acionar o botão de calcular, aplicando as fórmulas matemáticas por trás da UI.
* **Classificação de Resultados:** Retorno em texto indicando a faixa de peso em que o usuário se encontra (ex: Abaixo do peso, Peso ideal, Sobrepeso, Obesidade).
* **Histórico de Medições:** Todas as suas medições são automaticamente salvas em um banco de dados local **SQLite**, permitindo que você visualize e acompanhe a evolução do seu IMC ao longo do tempo.
* **Visualização e Gerenciamento do Histórico:** Uma tela dedicada lista todos os registros anteriores, com informações detalhadas como data, IMC calculado, peso e altura. Você também pode excluir entradas indesejadas com um simples gesto de deslizar.
* **Reset Rápido:** Um botão prático (geralmente na AppBar) para limpar os campos e os resultados, preparando a tela para uma nova medição.
* **Interface Responsiva:** Layout limpo e adaptável desenvolvido com os widgets padrão do Material Design.

## 🛠️ Tecnologias Utilizadas

* **[Flutter](https://flutter.dev/):** Framework UI do Google para a criação de aplicações nativas e responsivas.
* **[Dart](https://dart.dev/):** Linguagem de programação responsável por toda a lógica de negócio e gerenciamento de estado do aplicativo.
* **[SQLite](https://www.sqlite.org/):** Banco de dados relacional leve e embutido, utilizado para persistir o histórico de cálculos de IMC localmente no dispositivo.
* **[sqflite](https://pub.dev/packages/sqflite):** Plugin Flutter que fornece uma API para acesso e manipulação do banco SQLite de forma simples e eficiente.

## 📂 Como Executar este Projeto

Para rodar este projeto localmente na sua máquina, você precisará ter o ambiente do [Flutter SDK](https://docs.flutter.dev/get-started/install) configurado, além de um emulador Android/iOS ou um dispositivo físico conectado via depuração USB.

1. Clone este repositório:

   ```bash
   git clone https://github.com/Xang0/Calculadora_IMC_Flutter.git
   ```
