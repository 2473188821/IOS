<?php 

const PRIVATE_KEY = <<<EOD
-----BEGIN RSA PRIVATE KEY-----
MIICXAIBAAKBgQC5qjCPJ/4tmXkydHkKCSH23xSYjUQYI0vDl3RWvOlSen3ZX7AC
VwysbjLBSXJSKHVt826++vy+Q1I4VAcO8OIJg+xq/Lk+DxPffBoNrIoOg9Ky45ns
ozmMV3h5TUTQfB++zROtWncNkugLiKytQZJ+MGk/s9HLzGBHcn/d59IOZwIDAQAB
AoGAdHgm7icQdFqKhPQ72efQvqVCrlAwH1RE+vXPrXnkhDEDMZGtQEqLUL/wZwBE
DvYCdG75UiTw2AozUdKkeuLxaCMNkNGS+DVrW7msHwo+kY1QxJrX1qBw43xqh7t6
QSgWRCLefCP7TLoV7y45yWcOjrfOOvSfyh2aAxRqLebLd4ECQQD22ZpnbpWHpnZP
wp0cF38lV3hIPpTuSL/Mrv5+kg2/9nNuFx4m744Ug6l6O7ZtNX6zZXOmqG4cgBNX
GRVxrLtZAkEAwIv9q9WU5kDRtDA7Eq3dwQBSseU4xRVwQGAlCcRESiNXEg4/+tfY
bhYEFEN8Oq8OsTC2kDVHldi6HptS14afvwJBAKAizCK7P2/PkkLt2mQF7iq4UsRz
LMRkF2DeSSSs9RSJ+Zn6j0ns7/vo6cHtCMxR/s68SslbzIranzFKiXnD94kCQGLp
x4f1sYdTdycMu9wNq2SRiOnQaoh8Se0YNw68X6SCYSFqZp2zMoDjGHdcb74p3e9S
qgaNCFhHPN2qRzVm+DsCQHY4fLLOp1rw2vqJVo8MtezFhDPUylmzwQuqlmOVbyws
OGPaF0dg8TL1RfCbHWegTqYHc5aEHtrSiEGYkGs3Dec=
-----END RSA PRIVATE KEY-----
EOD;

$files = "";
$zipFile = "script.zip";
$finalFile = "v1";
for ($i = 1; $i < count($argv); $i ++) {
    if ($argv[$i] == '-o') {
        $finalFile = $argv[$i + 1];
        break;
    }
    $files .= $argv[$i] . " ";
}

if (!empty($files)) {

    //compress files
    echo system("zip $zipFile $files"); 

    //get and encrypt zip file's md5
    $zipFileMD5 = md5_file($zipFile);
    $private_key = openssl_pkey_get_private(PRIVATE_KEY);
    $ret = openssl_private_encrypt($zipFileMD5, $encrypted, $private_key);

    if (!$ret || empty($encrypted)) {
        unlink($zipFile);
        echo "fail to encrypt file md5";
    }

    $md5File = "key";
    file_put_contents($md5File, $encrypted);

    //pack script zip file and md5 file to final zip file
    echo system("zip $finalFile $zipFile $md5File"); 

    unlink($md5File);
    unlink($zipFile);
}
