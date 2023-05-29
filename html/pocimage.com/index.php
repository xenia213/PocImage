<!DOCTYPE html >
<script src="
https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js
"></script>
<link href="
https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css
" rel="stylesheet">
<title>poc finder</title>

<body class="text-center">
<img class="mb-4" src="cat.png" alt="" width="250" height="120">
    <div class="container text-center">
        <main class="form-signin">
        <form>
            <div class="row row-cols-2">
                <div class="col">
                    <h1 class="h3 mb-3 fw-normal">CVE:</h1>
                    <div class="form-floating">
                        <div class="form-group" method="get">
                            <textarea class="form-control" type="text" id="textInput" rows="8" name="data"></textarea>
                        </div>
                            <button id="textInput" class="w-100 btn btn-lg btn-primary" type="submit">find</button>
                        <?php
                        $dataList = explode(" ", $_GET['data']);
                        foreach ($dataList as $key) {
                            $fpSave = fopen('list_in', 'a+');
                            fwrite($fpSave, trim($key)."\n");
                            fclose($fpSave);
                        }
                        shell_exec('bash poc.sh');
                        ?>
                    </div>
                </div>
                <div class="col">

                    <div class="form-signin">
                    <h1 class="h3 mb-3 fw-normal">PoC:</h1>
                    <?php 
                        $fpOpen = fopen('list_out', 'r');
                        while ($line = fgets($fpOpen)) {
                    ?>
                        <div>
                            <a target="_blank" href=<?= $line?>><?= $line?></a>
                        </div>
                        <?php
                            }
                            fclose($fpOpen);
                        ?>
                    </div>
                </div>
            </div>
            <p class="mt-5 mb-3 text-muted">©Ks&#128062; 2023</p>
        </form>
        </main>
    </div>
