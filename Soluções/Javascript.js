var clientes = [
  {
    id: 1,
    nome: "Luis Santos Silveira",
    idade: 18,
  },
  {
    id: 2,
    nome: "Ricardo Lopes Alves",
    idade: 30,
  },
  {
    id: 3,
    nome: "gustavo Silva Junior",
    idade: 26,
  },
];

var numero = "5(1)9-876-543-21";

const numberRegex = /[()\s-]/g;

async function a() {
  b();
  await c();
  await d();
  alertUser("a");
}

a();

function b() {
  clientes.forEach((cliente) => {
    const nomeClienteSeparado = cliente.nome.split(" ");

    console.log(
      `${nomeClienteSeparado[0]} ${
        nomeClienteSeparado[nomeClienteSeparado.length - 1]
      }`
    );
  });
  return;
  alertUser("b");
}

function c() {
  return new Promise((resolve) => {
    const numeroRegex = numero.replace(numberRegex, "");

    resolve();

    const formatedNumber = `(${numeroRegex.substring(
      0,
      2
    )})_${numeroRegex.charAt(2)}_${numeroRegex.substring(
      3,
      7
    )}-${numeroRegex.substring(7, 11)}`;

    console.log(numeroRegex);

    console.log(formatedNumber);

    alertUser("c");
  });
}

function d() {
  return new Promise((resolve) => {
    alertUser("d");
  });
}

function alertUser(message) {
  console.log("A função é: " + message);
}
