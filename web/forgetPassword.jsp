<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HealHub - Forgot Password</title>
    <link rel="icon" type="image/png" href="favicon.png">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style> 
        body 
            { 
                font-family: 'Inter', sans-serif; 
            } 
    </style>
</head>
<body class="flex flex-col min-h-screen bg-gray-50">

    <!-- Navigation Bar (Shared) -->
    <nav class="bg-white border-b border-gray-100 shadow-sm sticky top-0 z-50">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16">
                <div class="flex items-center">
                    
                </div>
                <div class="hidden md:flex items-center space-x-8">
                    <a href="index.jsp" class="flex-shrink-0 flex items-center gap-2">
                        <div class="bg-teal-500 p-1.5 rounded-lg">
                            <i data-lucide="pill" class="h-6 w-6 text-white"></i>
                        </div>
                        <span class="font-bold text-xl text-gray-900 tracking-tight">HealHub</span>
                    </a>
                </div>
                
                <div class="hidden md:flex items-center">
                    <a href="#"></a>
                </div>
                
            </div>
        </div>
        
    </nav>

    <!-- Forgot Password Content -->
    <main class="flex-grow flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8 bg-gradient-to-br from-teal-400 to-cyan-500">
        <div class="max-w-lg w-full bg-white rounded-2xl shadow-xl border border-gray-100">
            <!-- Header Section -->
            <div class="bg-gray-50 px-8 py-6 rounded-t-2xl border-b border-gray-200">
                <h2 class="text-3xl font-extrabold text-gray-700 tracking-tight">
                    Forgot your password?
                </h2>
                <p class="mt-2 text-sm text-gray-500">
                    Change your password in three easy steps. This will help you to secure your password!
                </p>

                <!-- Steps -->
                <ol class="mt-4 space-y-2 text-sm text-gray-600">
                    <li class="flex items-start">
                        <span class="font-medium mr-2">1.</span>
                        <span>Enter your email address below.</span>
                    </li>
                    <li class="flex items-start">
                        <span class="font-medium mr-2">2.</span>
                        <span>Our system will send you an OTP to your email</span>
                    </li>
                    <li class="flex items-start">
                        <span class="font-medium mr-2">3.</span>
                        <span>Enter the OTP on the next page</span>
                    </li>
                </ol>
            </div>

            <!-- Form Section -->
            <form class="px-8 py-8 space-y-6" onsubmit="handleForgotPassword(event)" action="ForgetPasswordServlet" method="post">
                <div>
                    <label for="email" class="block text-sm font-medium text-gray-700 mb-2">
                        Enter your email address
                    </label>
                    <input
                        id="email"
                        name="email"
                        type="email"
                        autocomplete="email"
                        required
                        
                        class="appearance-none block w-full px-4 py-3 border border-gray-300 rounded-md placeholder-gray-400 text-gray-900 focus:outline-none focus:ring-teal-500 focus:border-teal-500 sm:text-sm"
                        placeholder="Enter your registered email"
                    >
                    <p class="mt-2 text-xs text-gray-500">
                        Enter the registered email address . Then we'll email a OTP to this address
                    </p>
                </div>

                <div class="flex flex-col sm:flex-row gap-3">
                    <button
                        type="submit"
                        class="flex-1 flex justify-center items-center gap-2 py-3 px-6 border border-transparent text-sm font-medium rounded-lg text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 transition-colors shadow-md"
                    >
                        <i data-lucide="key" class="h-4 w-4"></i>
                        Get New Password
                    </button>
                    <a
                        href="login.jsp"
                        class="flex-1 flex justify-center items-center gap-2 py-3 px-6 border border-transparent text-sm font-medium rounded-lg text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 transition-colors shadow-md"
                    >
                        <i data-lucide="arrow-left" class="h-4 w-4"></i>
                        Back to Login
                    </a>
                </div>
            </form>
        </div>
    </main>

    <!-- Footer (Shared) -->
    <footer class="bg-slate-900 text-slate-300">
        <div class="max-w-7xl mx-auto px-4 py-8 sm:px-6 lg:px-8 text-center text-xs">
            <p>&copy; 2026 HealHub. All rights reserved.</p>
        </div>
    </footer>

    <script>
        lucide.createIcons();

        

        function handleForgotPassword() {
            
            const email = document.getElementById('email').value;

            alert('If you are registered, An OTP has been sent to ' + email);

            
        }
    </script>
</body>
</html>

