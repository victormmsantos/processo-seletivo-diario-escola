<!DOCTYPE html>
<html>
<body>

<?php
$nomes = ['Francisco Souza', 'Guilherme Rosa', 'Arthur Golveia'];
$cliente1 = new stdClass();
$cliente1->nome = $nomes[0];
$cliente2 = new stdClass();
$cliente2->nome = $nomes[1];
$cliente3 = new stdClass();
$cliente3->nome = $nomes[2];
$arrayDeClientes = [$cliente1, $cliente2, $cliente3];

$arrayDeNascimento = [
    'Francisco Souza' => '10-12-1996',
    'Arthur Golveia' => '14-01-2000',
    'Guilherme Rosa' => '26-05-1985',
    'Marcelo Planalto' => '26-05-1985'
];

$cliente4 = new stdClass();
$cliente4->nome = 'Marcelo Planalto';
$cliente4->nascimento = $arrayDeNascimento['Marcelo Planalto'];

array_push($arrayDeClientes, $cliente4);

foreach ($arrayDeClientes as $cliente) {
    $nome = $cliente->nome;
    $cliente->dataNascimento = isset($arrayDeNascimento[$nome]) ? $arrayDeNascimento[$nome] : null;
}

usort($arrayDeClientes, function ($a, $b) {
    $dataA = isset($a->dataNascimento) ? date('Y-m-d', strtotime($a->dataNascimento)) : '';
    $dataB = isset($b->dataNascimento) ? date('Y-m-d', strtotime($b->dataNascimento)) : '';
    if ($dataA == $dataB) {
        return 0;
    }
    return ($dataA < $dataB) ? -1 : 1;
});


foreach ($arrayDeClientes as $cliente) {
    echo "{$cliente->nome} nascido em: {$cliente->dataNascimento} \n";
}
?>

</body>
</html>
