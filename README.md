<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TecWorld</title>
    <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body, html { height: 100%; font-family: 'Arial', sans-serif; }
    body { display: flex; justify-content: center; align-items: center; background-color: #0d0f12; overflow: hidden; }

    /* Vídeo de fundo */
    .background-video { 
        position: fixed; 
        top: 0; 
        left: 0; 
        width: 100%; 
        height: 100%; 
        object-fit: cover; 
        z-index: -1; 
        filter: brightness(0.3);
    }

    /* Camada translúcida sobre o vídeo */
    .overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.4); 
        z-index: 1;
    }

    .language-buttons { 
        position: absolute; 
        top: 10px; 
        right: 10px; 
        z-index: 2; 
    }

    .language-buttons select { 
        padding: 5px 10px; 
        cursor: pointer; 
        background-color: #333; 
        color: #fff;
        border-radius: 5px;
    }

    .title { 
        position: absolute; 
        top: 150px; 
        left: 50%;
        transform: translateX(-50%);
        z-index: 2; 
        color: #E0FFFF; 
        font-size: 36px; 
        font-weight: bold; 
        font-family: 'Arial', sans-serif;
        text-align: center;
    }

    .description { 
        position: absolute; 
        top: 250px;
        left: 50%;
        transform: translateX(-50%);
        z-index: 2; 
        color: #E0FFFF; 
        font-size: 20px; 
        font-family: 'Arial', sans-serif; 
        line-height: 1.6; 
        text-align: center;
    }

    .start-button {
        position: absolute;
        top: 395px; 
        left: 50%;
        transform: translateX(-50%);
        z-index: 2;
        padding: 12px 24px;
        background: linear-gradient(90deg, #6cc6df, #152e4d);
        color: white;
        font-size: 16px;
        font-weight: bold;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: 0.3s;
    }

    .start-button:hover {
        background: linear-gradient(90deg, #6cc6df, #152e4d);
        transform: scale(1.05);
    }
    </style>
</head>
<body>

    <!-- Título no centro -->
    <div class="title">TecWorld - <br>Conectando o Mundo</div>

    <!-- Descrição abaixo do título -->
    <div class="description">
        Conecte-se com pessoas ao redor do mundo. Explore bate-papos,<br> faça novas amizades, aprenda idiomas e descubra novas culturas.<br> Personalize suas tags e encontre pessoas com interesses em comum.<br> O mundo está a um clique de distância!
    </div>

    <!-- Botão "Iniciar" -->
    <button class="start-button" onclick="startChat()">Iniciar</button>

    <!-- Botão de seleção de idioma -->
    <div class="language-buttons">
        <select onchange="changeLanguage(this.value)">
            <option value="pt">🇧🇷 Português</option>
            <option value="en">🇺🇸 English</option>
            <option value="es">🇪🇸 Español</option>
        </select>
    </div>

    <video autoplay muted loop class="background-video">
        <source src="rei.mp4" type="video/mp4">
        Seu navegador não suporta a tag de vídeo.
    </video>

</body>
</html>
