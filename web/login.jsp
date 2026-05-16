<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HealHub - Login</title>
    <link rel="icon" type="image/png" href="favicon.png">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body{ 
            font-family: 'Inter', sans-serif;
            } 
    </style>
</head>
<body class="flex flex-col min-h-screen bg-gray-50">
    
    <%
            
            String email = (String)session.getAttribute("email");
            
            if(email!=null)
            {
                if(email.equalsIgnoreCase("admin@gmail.com"))
                {
                    response.sendRedirect("adminDashboard.jsp");
                }
                else
                {
                    response.sendRedirect("userDashboard.jsp");
                }
            }
            
            String error = request.getParameter("error");
            
            if(error != null && error.equals("invalid"))
            {
     %>
     
     <script>
        alert("Invalid Email or Password!");
    </script>

    <%
            }
    %>

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
                 <div class="-mr-2 flex items-center md:hidden">
                    <button type="button" onclick="toggleMenu()" class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-teal-500">
                        <span class="sr-only">Open main menu</span>
                        <i data-lucide="menu" class="block h-6 w-6"></i>
                    </button>
                </div>
            </div>
        </div>
        
    </nav>

    <!-- Login Content -->
    <main class="flex-grow flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8 bg-gradient-to-br from-teal-400 to-cyan-500">
        <div class="max-w-md w-full space-y-8 bg-white p-10 rounded-2xl shadow-xl border border-gray-100">
            <div class="text-center">
                <h2 class="mt-2 text-3xl font-extrabold text-gray-900 tracking-tight">
                    Welcome Back
                </h2>
                <p class="mt-2 text-sm text-gray-500">
                    Sign in to access your dashboard
                </p>
            </div>

            
            <form action="LoginServlet" method="post" class="mt-8 space-y-6" onsubmit="handleLogin(event)">
                <div class="rounded-md shadow-sm -space-y-px">
                    <div class="relative mb-3">
                        
                        <input id="email" name="email" type="text" required class="appearance-none rounded-md relative block w-full px-10 py-3 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-teal-500 focus:border-teal-500 focus:z-10 sm:text-sm" placeholder="Email Address">
                    </div>
                    <div class="relative mb-3">
                        
                        <input id="password" name="password" type="password" required class="appearance-none rounded-md relative block w-full px-10 py-3 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-teal-500 focus:border-teal-500 focus:z-10 sm:text-sm" placeholder="Password">
                    </div>
                </div>

                <div class="flex items-center justify-between">
                    <div class="flex items-center">
                        <input id="remember-me" name="remember-me" type="checkbox" class="h-4 w-4 text-teal-600 focus:ring-teal-500 border-gray-300 rounded">
                        <label for="remember-me" class="ml-2 block text-sm text-gray-900">
                            Remember me
                        </label>
                    </div>

                    <div class="text-sm">
                        <a href="forgetPassword.jsp" class="font-medium text-teal-600 hover:text-teal-500">
                            Forgot your password?
                        </a>
                    </div>
                </div>

                <div>
                    <button type="submit" class="group relative w-full flex justify-center py-3 px-4 border border-transparent text-sm font-medium rounded-lg text-white bg-teal-600 hover:bg-teal-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-teal-500 transition-colors shadow-lg shadow-teal-100">
                        <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                            <i data-lucide="arrow-right" class="h-5 w-5 text-teal-500 group-hover:text-teal-400"></i>
                        </span>
                        <span id="submit-text">Login</span>
                    </button>
                </div>
            </form>
            
            <div class="text-center mt-4">
                <p class="text-sm text-gray-600">
                    Don't have an account? <a href="register.jsp" class="font-medium text-teal-600 hover:text-teal-500">Register</a>
                </p>
            </div>
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
    </script>
</body>
</html>
