<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - TecWorld</title>
    <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body, html { height: 100%; font-family: Arial, sans-serif; }
    body { display: flex; justify-content: center; align-items: center; background-color: #0d0f12; overflow: hidden; }

    /* Vídeo de fundo */
    .background-video { 
        position: fixed; 
        top: 0; 
        left: 0; 
        width: 100%; 
        height: 100%; 
        object-fit: cover; 
        z-index: -1; /* Coloca o vídeo atrás da camada translúcida */
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
        padding: 8px 12px;
        cursor: pointer;
        background-color: #444;
        color: #fff;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 12px;
        transition: background-color 0.3s, transform 0.3s;
    }

    .language-buttons select:hover {
        background-color: #555;
        transform: scale(1.05);
    }

    .language-buttons option {
        background-color: #333;
        color: white;
    }

    /* Container do formulário de login */
    .login-container { 
        display: flex; 
        justify-content: center; 
        align-items: center; 
        height: 100%; 
        z-index: 2; 
    }

    form.invisible {
        background-color: transparent;
        padding: 30px;
        box-shadow: none;
        border-radius: 0;
        width: 350px;
        text-align: center;
        margin: 10px;
    }

    h1 {
        font-size: 32px;
        margin-bottom: 25px;
        color: #E0FFFF;
    }

    input[type="text"], input[type="password"], input[type="email"] {
        width: 100%;
        padding: 14px;
        margin: 10px 0;
        border: 1px solid #b3dae4;
        border-radius: 8px;
        background-color: #8ed2e4;
        color: #ffffff;
        font-size: 18px;
    }

    input[type="text"]::placeholder, input[type="password"]::placeholder, input[type="email"]::placeholder {
        color: #000;
    }

    .login-btn {
        width: 100%;
        padding: 14px;
        background: linear-gradient(90deg, #a6e9df 0%, #00aaff 100%);
        border: none;
        border-radius: 8px;
        color: #000;
        font-size: 18px;
        cursor: pointer;
        margin-top: 20px;
        transition: 0.3s;
    }

    .login-btn:hover {
        background: linear-gradient(90deg, #ffffff 0%, #f3f3f3 100%);
        transform: scale(1.05);
    }

    .forgot-password, .create-account, .back-to-login {
        display: block;
        margin-top: 20px;
        font-size: 14px;
        color: #00ffd9;
        text-decoration: none;
    }

    .forgot-password:hover, .create-account:hover, .back-to-login:hover {
        text-decoration: underline;
        color: #00aaff;
    }

    .error-message {
        color: #ff6347;
        font-size: 16px;
        margin-bottom: 10px;
        text-align: left;
        font-family: Verdana, sans-serif;
        display: block;
    }

    .error-input { border: 1px solid #ff6347; }

    .checkbox-container { 
        display: flex; 
        flex-direction: row; 
        align-items: center; 
        font-size: 14px; 
        color: #E0FFFF; 
        margin-top: 10px; 
    }

    .checkbox-container label { margin-right: 10px; }
    .checkbox-container input { margin-right: 5px; }

    /* Media Query para dispositivos móveis */
    @media screen and (max-width: 768px) {
        .login-container { 
            flex-direction: column; 
            padding: 20px; 
        }
        h1 { 
            font-size: 26px; 
        }
        input[type="text"], input[type="password"], input[type="email"] {
            font-size: 16px;
        }
        .login-btn { 
            font-size: 16px; 
        }
        .language-buttons select {
            font-size: 14px;
        }
    }
    </style>
</head>
<body>

    <div class="language-buttons">
        <select onchange="changeLanguage(this.value)">
            <option value="pt">🇧🇷 Português</option>
            <option value="en">🇺🇸 English</option>
            <option value="es">🇪🇸 Español</option>
        </select>
    </div>

    <video autoplay muted loop class="background-video">
        <source src="videos/rei.mp4" type="video/mp4">
        Seu navegador não suporta a tag de vídeo.
    </video>

    <div class="overlay"></div>

    <div class="login-container">
        <form id="login-form" class="invisible" onsubmit="return validateForm(event)">
            <!-- Conteúdo será gerado dinamicamente pelo JavaScript -->
        </form>
    </div>

    <script>
        const translations = {
            pt: {
                heading: "TecWorld",
                emailPlaceholder: "Email ou nome de usuario",
                passwordPlaceholder: "Senha",
                loginButton: "Entrar",
                forgotPassword: "Esqueceu a senha?",
                createAccount: "Criar Conta",
                recoverHeading: "Recuperar Senha",
                recoverButton: "Recuperar",
                createHeading: "Criar Conta - TecWorld",
                createUsernamePlaceholder: "Nome de usuário",
                createEmailPlaceholder: "Email",
                createPasswordPlaceholder: "Senha",
                createTerms: "Aceito os <a href='termos.html' target='_blank'>Termos de Uso</a>",
                createPrivacy: "Aceito a <a href='privacidade.html' target='_blank'>Política de Privacidade</a>",
                createRegister: "Cadastrar",
                backToLogin: "Já tem conta? Entrar",
                generalError: "Por favor, preencha todos os campos solicitados.",
                invalidEmail: "Por favor, insira um email válido (Gmail, Outlook, Yahoo Mail, Apple Mail, ProtonMail, Zoho Mail).",
                invalidPassword: "A senha deve ter mais de 5 caracteres.",
                termsError: "Você precisa aceitar os Termos de Uso e a Política de Privacidade."
            },
            en: {
                heading: "TecWorld",
                emailPlaceholder: "Email or username",
                passwordPlaceholder: "Password",
                loginButton: "Login",
                forgotPassword: "Forgot password?",
                createAccount: "Create Account",
                recoverHeading: "Recover Password",
                recoverButton: "Recover",
                createHeading: "Create Account - TecWorld",
                createUsernamePlaceholder: "Username",
                createEmailPlaceholder: "Email",
                createPasswordPlaceholder: "Password",
                createTerms: "I accept the <a href='terms.html' target='_blank'>Terms of Use</a>",
                createPrivacy: "I accept the <a href='privacy.html' target='_blank'>Privacy Policy</a>",
                createRegister: "Register",
                backToLogin: "Already have an account? Login",
                generalError: "Please fill in all required fields.",
                invalidEmail: "Please enter a valid email (Gmail, Outlook, Yahoo Mail, Apple Mail, ProtonMail, Zoho Mail).",
                invalidPassword: "Password must be more than 5 characters.",
                termsError: "You must accept the Terms of Use and Privacy Policy."
            },
            es: {
                heading: "TecWorld",
                emailPlaceholder: "Correo electrónico o nombre de usuario",
                passwordPlaceholder: "Contraseña",
                loginButton: "Iniciar sesión",
                forgotPassword: "¿Olvidaste tu contraseña?",
                createAccount: "Crear Cuenta",
                recoverHeading: "Recuperar Contraseña",
                recoverButton: "Recuperar",
                createHeading: "Crear Cuenta - TecWorld",
                createUsernamePlaceholder: "Nombre de usuario",
                createEmailPlaceholder: "Correo electrónico",
                createPasswordPlaceholder: "Contraseña",
                createTerms: "Acepto los <a href='terminos.html' target='_blank'>Términos de Uso</a>",
                createPrivacy: "Acepto la <a href='privacidad.html' target='_blank'>Política de Privacidad</a>",
                createRegister: "Registrar",
                backToLogin: "¿Ya tienes cuenta? Iniciar sesión",
                generalError: "Por favor, complete todos los campos requeridos.",
                invalidEmail: "Por favor, ingresa un correo electrónico válido (Gmail, Outlook, Yahoo Mail, Apple Mail, ProtonMail, Zoho Mail).",
                invalidPassword: "La contraseña debe tener más de 5 caracteres.",
                termsError: "Debes aceptar los Términos de Uso y la Política de Privacidad."
            }
        };

        let currentLanguage = 'pt';

        function changeLanguage(lang) {
            currentLanguage = lang;
            showLogin();
        }

        function showLogin() {
            const t = translations[currentLanguage];
            document.getElementById('login-form').innerHTML = `
                <h1>${t.heading}</h1>
                <input type="text" id="email" placeholder="${t.emailPlaceholder}">
                <input type="password" id="password" placeholder="${t.passwordPlaceholder}">
                <div id="general-error" class="error-message"></div>
                <button type="submit" class="login-btn">${t.loginButton}</button>
                <a href="#" class="forgot-password" onclick="showForgotPassword()">${t.forgotPassword}</a>
                <a href="#" class="create-account" onclick="showCreateAccount()">${t.createAccount}</a>
            `;
        }

        function showForgotPassword() {
            const t = translations[currentLanguage];
            document.getElementById('login-form').innerHTML = `
                <h1>${t.recoverHeading}</h1>
                <input type="email" placeholder="${t.emailPlaceholder}" id="email">
                <button type="submit" class="login-btn">${t.recoverButton}</button>
                <a href="#" class="back-to-login" onclick="showLogin()">${t.backToLogin}</a>
            `;
        }

        function showCreateAccount() {
            const t = translations[currentLanguage];
            document.getElementById('login-form').innerHTML = `
                <h1>${t.createHeading}</h1>
                <input type="text" placeholder="${t.createUsernamePlaceholder}" id="username">
                <input type="email" placeholder="${t.createEmailPlaceholder}" id="email">
                <input type="password" placeholder="${t.createPasswordPlaceholder}" id="password">
                <div class="checkbox-container">
                    <input type="checkbox" id="terms">
                    <label for="terms">${t.createTerms}</label>
                    <input type="checkbox" id="privacy">
                    <label for="privacy">${t.createPrivacy}</label>
                </div>
                <button type="submit" class="login-btn">${t.createRegister}</button>
                <a href="#" class="back-to-login" onclick="showLogin()">${t.backToLogin}</a>
            `;
        }

        function validateForm(event) {
            event.preventDefault();
            const t = translations[currentLanguage];
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            const generalError = document.getElementById('general-error');
            const errorMsg = [];
            if (!email || !password) {
                errorMsg.push(t.generalError);
            }
            if (!email.match(/^[^@]+@[^@]+\.[^@]+$/)) {
                errorMsg.push(t.invalidEmail);
            }
            if (password.length <= 5) {
                errorMsg.push(t.invalidPassword);
            }
            if (errorMsg.length > 0) {
                generalError.innerHTML = errorMsg.join('<br>');
            } else {
                alert('Formulário enviado!');
            }
        }

        showLogin();
    </script>

</body>
</html>
