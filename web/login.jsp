<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HealHub — Sign In</title>
    <link rel="icon" type="image/png" href="favicon.png">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; }

        .dot-grid {
            background-image: radial-gradient(circle, rgba(255,255,255,0.18) 1px, transparent 1px);
            background-size: 26px 26px;
        }

        .hh-input {
            transition: border-color 0.18s, background-color 0.18s, box-shadow 0.18s;
        }
        .hh-input:focus {
            outline: none;
            border-color: #0d9488;
            background-color: #fff;
            box-shadow: 0 0 0 3px rgba(13,148,136,0.14);
        }
        /* Red border on invalid field */
        .hh-input.field-error {
            border-color: #f87171;
            background-color: #fff;
            box-shadow: 0 0 0 3px rgba(248,113,113,0.12);
        }
        .hh-input.field-error:focus {
            border-color: #ef4444;
            box-shadow: 0 0 0 3px rgba(239,68,68,0.14);
        }

        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(14px); }
            to   { opacity: 1; transform: translateY(0);    }
        }
        .fade-up { animation: fadeUp 0.42s ease-out both; }
        .d-1 { animation-delay: 0.04s; }
        .d-2 { animation-delay: 0.09s; }
        .d-3 { animation-delay: 0.14s; }
        .d-4 { animation-delay: 0.20s; }
        .d-5 { animation-delay: 0.26s; }
        .d-6 { animation-delay: 0.32s; }

        /* Error message shake */
        @keyframes shake {
            0%,100% { transform: translateX(0);   }
            20%     { transform: translateX(-5px); }
            40%     { transform: translateX(5px);  }
            60%     { transform: translateX(-4px); }
            80%     { transform: translateX(4px);  }
        }
        .shake { animation: shake 0.35s ease-out; }

        @keyframes spin { to { transform: rotate(360deg); } }
        .spinning { animation: spin 0.8s linear infinite; display: inline-block; }

        .btn-primary { transition: background-color 0.18s, transform 0.18s, box-shadow 0.18s; }
        .btn-primary:not(:disabled):hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(13,148,136,0.35);
        }
        .btn-primary:not(:disabled):active { transform: translateY(0); }
        .btn-primary:disabled {
            opacity: 0.45;
            cursor: not-allowed;
            transform: none !important;
            box-shadow: none !important;
        }
    </style>
</head>

<body class="min-h-screen flex flex-col">

<%
    String email     = (String) session.getAttribute("email");
    String errorcode = (String) session.getAttribute("error");

    if (email != null) {
        if (email.equalsIgnoreCase("admin@gmail.com")) {
            response.sendRedirect("adminDashboard.jsp");
        } else {
            response.sendRedirect("userDashboard.jsp");
        }
    }

    String error = request.getParameter("error");
    if (error != null && error.equals("invalid")) {
%>
<script>alert("Invalid Email or Password!");</script>
<%  } %>

<!-- NAVBAR -->
<nav class="bg-white border-b border-gray-100 shadow-sm sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between h-16">

            <a href="index.jsp" class="flex items-center gap-2 flex-shrink-0">
                <div class="bg-teal-500 p-1.5 rounded-lg">
                    <i data-lucide="pill" class="h-6 w-6 text-white"></i>
                </div>
                <span class="font-bold text-xl text-gray-900 tracking-tight">HealHub</span>
            </a>

            <span class="hidden md:flex items-center gap-1.5 text-sm text-gray-500">
                New here?
                <a href="register.jsp" class="font-semibold text-teal-600 hover:text-teal-700 transition-colors">
                    Create a free account
                </a>
            </span>

            <button type="button" onclick="toggleMobileMenu()"
                class="md:hidden inline-flex items-center justify-center p-2 rounded-md text-gray-400
                       hover:text-gray-600 hover:bg-gray-100 focus:outline-none
                       focus:ring-2 focus:ring-inset focus:ring-teal-500">
                <span class="sr-only">Open menu</span>
                <i data-lucide="menu" class="h-5 w-5" id="nav-menu-icon"></i>
            </button>
        </div>
    </div>

    <div id="mobile-menu" class="hidden md:hidden border-t border-gray-100 bg-white px-4 pb-3 pt-2 space-y-1">
        <a href="index.jsp"    class="block py-2 px-3 text-sm text-gray-600 hover:text-teal-600 hover:bg-teal-50 rounded-lg transition-colors">Home</a>
        <a href="register.jsp" class="block py-2 px-3 text-sm text-gray-600 hover:text-teal-600 hover:bg-teal-50 rounded-lg transition-colors">Create Account</a>
    </div>
</nav>

<!-- SPLIT-PANEL MAIN -->
<main class="flex-grow flex min-h-0">

    <!-- LEFT: Branded panel -->
    <div class="hidden lg:flex lg:w-[44%] xl:w-[48%] relative overflow-hidden
                bg-gradient-to-br from-teal-700 via-teal-500 to-cyan-400
                flex-col justify-between p-12 xl:p-16">

        <div class="dot-grid absolute inset-0 pointer-events-none"></div>
        <div class="absolute -top-24 -right-24 w-72 h-72 rounded-full bg-white/10"></div>
        <div class="absolute top-1/2 right-0 w-40 h-40 rounded-full bg-white/10 -translate-y-1/2 translate-x-1/2"></div>
        <div class="absolute -bottom-16 -left-16 w-56 h-56 rounded-full bg-white/10"></div>

        <div class="relative z-10">
            <div class="inline-flex items-center gap-2.5 bg-white/15 backdrop-blur-sm border border-white/25 rounded-2xl px-4 py-2 mb-10">
                <i data-lucide="pill" class="h-4 w-4 text-white"></i>
                <span class="text-white font-semibold text-sm tracking-tight">HealHub</span>
            </div>

            <h1 class="text-4xl xl:text-5xl font-extrabold text-white leading-tight tracking-tight mb-5">
                Your Health,<br>Connected.
            </h1>
            <p class="text-teal-100 text-[15px] leading-relaxed max-w-xs mb-12">
                Locate verified pharmacies, check medicine availability, and manage your healthcare journey — all in one place.
            </p>

            <ul class="space-y-4">
                <li class="flex items-center gap-3.5">
                    <div class="w-9 h-9 rounded-xl bg-white/20 flex items-center justify-center flex-shrink-0">
                        <i data-lucide="map-pin" class="h-4 w-4 text-white"></i>
                    </div>
                    <span class="text-sm text-teal-50">Find verified pharmacies near you in real-time</span>
                </li>
                <li class="flex items-center gap-3.5">
                    <div class="w-9 h-9 rounded-xl bg-white/20 flex items-center justify-center flex-shrink-0">
                        <i data-lucide="clock-3" class="h-4 w-4 text-white"></i>
                    </div>
                    <span class="text-sm text-teal-50">Check opening hours &amp; live medicine availability</span>
                </li>
                <li class="flex items-center gap-3.5">
                    <div class="w-9 h-9 rounded-xl bg-white/20 flex items-center justify-center flex-shrink-0">
                        <i data-lucide="shield-check" class="h-4 w-4 text-white"></i>
                    </div>
                    <span class="text-sm text-teal-50">Secure, private &amp; trusted by thousands of users</span>
                </li>
            </ul>
        </div>

        <p class="relative z-10 text-teal-200/60 text-xs mt-8">
            &copy; 2026 HealHub. All rights reserved.
        </p>
    </div>

    <!-- RIGHT: Form panel -->
    <div class="w-full lg:w-[56%] xl:w-[52%] flex items-center justify-center
                bg-white px-6 py-14 sm:px-10 xl:px-20">
        <div class="w-full max-w-md">

            <!-- Mobile logo -->
            <div class="lg:hidden flex justify-center mb-10">
                <a href="index.jsp" class="flex items-center gap-2">
                    <div class="bg-teal-500 p-1.5 rounded-lg">
                        <i data-lucide="pill" class="h-6 w-6 text-white"></i>
                    </div>
                    <span class="font-bold text-xl text-gray-900 tracking-tight">HealHub</span>
                </a>
            </div>

            <!-- Heading -->
            <div class="mb-8 fade-up">
                <h2 class="text-[28px] font-bold text-gray-900 leading-tight mb-1.5">Welcome back</h2>
                <p class="text-gray-400 text-[14px]">Sign in to continue to your dashboard</p>
            </div>

            <!-- Server-side error banner -->
            <% if ("invalidlogin".equals(errorcode)) { %>
            <div class="flex items-start gap-3 bg-red-50 border border-red-200 rounded-xl px-4 py-3 mb-6 fade-up text-sm text-red-700">
                <i data-lucide="alert-circle" class="h-4 w-4 mt-0.5 flex-shrink-0 text-red-500"></i>
                <span>Incorrect email or password. Please try again.</span>
            </div>
            <% session.removeAttribute("error"); } %>

            <!-- Form -->
            <form action="LoginServlet" method="post" onsubmit="handleSubmit(event)" class="space-y-5" novalidate>

                <!-- Email -->
                <div class="fade-up d-1">
                    <label for="email" class="block text-sm font-medium text-gray-700 mb-1.5">
                        Email Address
                    </label>
                    <div class="relative group">
                        <div class="absolute inset-y-0 left-0 pl-3.5 flex items-center pointer-events-none">
                            <i data-lucide="mail" class="h-4 w-4 text-gray-400 transition-colors group-focus-within:text-teal-500"></i>
                        </div>
                        <input
                            id="email"
                            name="email"
                            type="text"
                            required
                            autocomplete="username"
                            placeholder="you@example.com"
                            class="hh-input block w-full pl-10 pr-4 py-3 text-sm text-gray-900
                                   border border-gray-200 rounded-xl bg-gray-50
                                   placeholder:text-gray-400">
                    </div>
                    <!-- Email error message -->
                    <p id="email-error"
                       class="hidden mt-1.5 flex items-center gap-1.5 text-xs text-red-600 font-medium">
                        <i data-lucide="alert-circle" class="h-3.5 w-3.5 flex-shrink-0"></i>
                        <span id="email-error-text"></span>
                    </p>
                </div>

                <!-- Password -->
                <div class="fade-up d-2">
                    <label for="password" class="block text-sm font-medium text-gray-700 mb-1.5">
                        Password
                    </label>
                    <div class="relative group">
                        <div class="absolute inset-y-0 left-0 pl-3.5 flex items-center pointer-events-none">
                            <i data-lucide="lock" class="h-4 w-4 text-gray-400 transition-colors group-focus-within:text-teal-500"></i>
                        </div>
                        <input
                            id="password"
                            name="password"
                            type="password"
                            required
                            autocomplete="current-password"
                            placeholder="••••••••"
                            class="hh-input block w-full pl-10 pr-12 py-3 text-sm text-gray-900
                                   border border-gray-200 rounded-xl bg-gray-50
                                   placeholder:text-gray-400">
                        <button type="button" onclick="togglePassword()"
                            title="Show or hide password"
                            class="absolute inset-y-0 right-0 pr-3.5 flex items-center
                                   text-gray-400 hover:text-teal-600 transition-colors">
                            <i data-lucide="eye" id="eye-icon" class="h-4 w-4"></i>
                        </button>
                    </div>
                    <!-- Password error message -->
                    <p id="password-error"
                       class="hidden mt-1.5 flex items-center gap-1.5 text-xs text-red-600 font-medium">
                        <i data-lucide="alert-circle" class="h-3.5 w-3.5 flex-shrink-0"></i>
                        <span id="password-error-text"></span>
                    </p>
                </div>

                <!-- Remember me + Forgot password -->
                <div class="fade-up d-3 space-y-1.5">
                    <div class="flex items-center justify-between">
                        <label class="flex items-center gap-2.5 cursor-pointer group">
                            <input
                                id="remember-me"
                                name="remember-me"
                                type="checkbox"
                                class="h-4 w-4 rounded border-gray-300 text-teal-600 focus:ring-teal-500 cursor-pointer">
                            <span class="text-sm text-gray-600 group-hover:text-gray-900 transition-colors select-none">
                                Remember me
                            </span>
                        </label>
                        <a href="forgetPassword.jsp"
                            class="text-sm font-medium text-teal-600 hover:text-teal-700 transition-colors">
                            Forgot password?
                        </a>
                    </div>
                    <!-- Checkbox hint (shows only when email+password filled but checkbox unchecked) -->
                    <p id="checkbox-hint" class="hidden flex items-center gap-1.5 text-xs text-amber-600 font-medium">
                        <i data-lucide="info" class="h-3.5 w-3.5 flex-shrink-0"></i>
                        Please check "Remember me" to continue
                    </p>
                </div>

                <!-- Submit button — starts disabled -->
                <div class="pt-1 fade-up d-4">
                    <button type="submit" id="submit-btn" disabled
                        class="btn-primary w-full flex items-center justify-center gap-2
                               py-3.5 px-4 rounded-xl bg-teal-600 hover:bg-teal-700
                               text-white text-sm font-semibold
                               shadow-lg shadow-teal-500/25
                               focus:outline-none focus:ring-2 focus:ring-teal-500 focus:ring-offset-2">
                        <span id="btn-icon-wrap">
                            <i data-lucide="arrow-right" class="h-4 w-4"></i>
                        </span>
                        <span id="submit-text">Sign In</span>
                    </button>

                    <!-- Progress indicator below button -->
                    <p id="form-hint" class="mt-2.5 text-center text-xs text-gray-400 transition-all"></p>
                </div>
            </form>

            <!-- Register link -->
            <p class="mt-7 text-center text-sm text-gray-500 fade-up d-5">
                Don't have an account?
                <a href="register.jsp" class="font-semibold text-teal-600 hover:text-teal-700 transition-colors ml-1">
                    Create one free
                </a>
            </p>

            <!-- Trust badges -->
            <div class="mt-8 flex items-center justify-center gap-5 fade-up d-6">
                <div class="flex items-center gap-1.5 text-xs text-gray-400">
                    <i data-lucide="shield" class="h-3.5 w-3.5 text-teal-400"></i>
                    SSL Secured
                </div>
                <div class="w-px h-4 bg-gray-200"></div>
                <div class="flex items-center gap-1.5 text-xs text-gray-400">
                    <i data-lucide="lock" class="h-3.5 w-3.5 text-teal-400"></i>
                    Privacy Protected
                </div>
                <div class="w-px h-4 bg-gray-200"></div>
                <div class="flex items-center gap-1.5 text-xs text-gray-400">
                    <i data-lucide="check-circle-2" class="h-3.5 w-3.5 text-teal-400"></i>
                    Verified Platform
                </div>
            </div>

        </div>
    </div>
</main>

<!-- Footer — mobile only -->
<footer class="lg:hidden bg-slate-900 text-slate-400">
    <div class="max-w-7xl mx-auto px-4 py-5 text-center text-xs">
        &copy; 2026 HealHub. All rights reserved.
    </div>
</footer>

<script>
    lucide.createIcons();

    /* ── Element refs ── */
    const emailInput  = document.getElementById('email');
    const passInput   = document.getElementById('password');
    const checkbox    = document.getElementById('remember-me');
    const submitBtn   = document.getElementById('submit-btn');
    const formHint    = document.getElementById('form-hint');
    const cbHint      = document.getElementById('checkbox-hint');

    /* ─────────────────────────────────────────
       REAL-TIME ENABLE / DISABLE + HINT
    ───────────────────────────────────────── */
    function syncButton() {
        const hasEmail    = emailInput.value.trim() !== '';
        const hasPassword = passInput.value.trim() !== '';
        const hasChecked  = checkbox.checked;
        const allDone     = hasEmail && hasPassword && hasChecked;

        submitBtn.disabled = !allDone;

        // Checkbox hint: show only when both fields are filled but box is unchecked
        if (hasEmail && hasPassword && !hasChecked) {
            cbHint.classList.remove('hidden');
        } else {
            cbHint.classList.add('hidden');
        }

        // Progress hint below button
        if (!hasEmail && !hasPassword) {
            formHint.textContent = 'Enter your email and password to sign in';
        } else if (!hasEmail) {
            formHint.textContent = 'Email address is required';
        } else if (!hasPassword) {
            formHint.textContent = 'Password is required';
        } else if (!hasChecked) {
            formHint.textContent = 'Please check "Remember me" to enable sign in';
        } else {
            formHint.textContent = '';
        }

        lucide.createIcons();
    }

    emailInput.addEventListener('input',  syncButton);
    passInput.addEventListener('input',   syncButton);
    checkbox.addEventListener('change',   syncButton);

    // Run once on load so initial state is correct
    syncButton();

    /* ─────────────────────────────────────────
       INLINE FIELD ERRORS (on blur)
    ───────────────────────────────────────── */
    function showFieldError(inputEl, errorId, textId, message) {
        inputEl.classList.add('field-error');
        const wrap = document.getElementById(errorId);
        document.getElementById(textId).textContent = message;
        wrap.classList.remove('hidden');
        // Shake animation: remove then re-add
        wrap.classList.remove('shake');
        void wrap.offsetWidth; // reflow
        wrap.classList.add('shake');
        lucide.createIcons();
    }

    function clearFieldError(inputEl, errorId) {
        inputEl.classList.remove('field-error');
        document.getElementById(errorId).classList.add('hidden');
    }

    /* Email blur */
    emailInput.addEventListener('blur', () => {
        const val = emailInput.value.trim();
        if (!val) {
            showFieldError(emailInput, 'email-error', 'email-error-text', 'Email address is required');
        } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(val)) {
            showFieldError(emailInput, 'email-error', 'email-error-text', 'Enter a valid email address');
        } else {
            clearFieldError(emailInput, 'email-error');
        }
    });

    /* Clear email error as user types */
    emailInput.addEventListener('input', () => {
        if (emailInput.value.trim()) clearFieldError(emailInput, 'email-error');
    });

    /* Password blur */
    passInput.addEventListener('blur', () => {
        if (!passInput.value) {
            showFieldError(passInput, 'password-error', 'password-error-text', 'Password is required');
        } else {
            clearFieldError(passInput, 'password-error');
        }
    });

    /* Clear password error as user types */
    passInput.addEventListener('input', () => {
        if (passInput.value) clearFieldError(passInput, 'password-error');
    });

    /* ─────────────────────────────────────────
       SUBMIT — loading state, still POSTs to LoginServlet
    ───────────────────────────────────────── */
    function handleSubmit(e) {
        // Final guard (button should already be disabled if invalid)
        if (!emailInput.value.trim() || !passInput.value.trim() || !checkbox.checked) {
            e.preventDefault();
            return;
        }

        const text = document.getElementById('submit-text');
        const wrap = document.getElementById('btn-icon-wrap');
        submitBtn.disabled = true;
        wrap.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" class="spinning" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M21 12a9 9 0 1 1-6.219-8.56"/></svg>';
        text.textContent = 'Signing in\u2026';
        formHint.textContent = '';
    }

    /* ─────────────────────────────────────────
       PASSWORD SHOW / HIDE
    ───────────────────────────────────────── */
    let pwVisible = false;
    function togglePassword() {
        pwVisible = !pwVisible;
        passInput.type = pwVisible ? 'text' : 'password';
        document.getElementById('eye-icon').setAttribute('data-lucide', pwVisible ? 'eye-off' : 'eye');
        lucide.createIcons();
        passInput.focus();
    }

    /* ─────────────────────────────────────────
       MOBILE NAV TOGGLE
    ───────────────────────────────────────── */
    let menuOpen = false;
    function toggleMobileMenu() {
        menuOpen = !menuOpen;
        document.getElementById('mobile-menu').classList.toggle('hidden', !menuOpen);
        document.getElementById('nav-menu-icon').setAttribute('data-lucide', menuOpen ? 'x' : 'menu');
        lucide.createIcons();
    }
</script>

</body>
</html>