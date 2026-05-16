<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HealHub - Register</title>
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
        
    <%
        
        String error = (String)session.getAttribute("error");
        
        if(error!=null)
        {
    
    %>
    
    <script>
        alert("<%= error %>");
    </script>
    
    <%  session.removeAttribute("error");
        
        } %>
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
                    
                </div>
                 
            </div>
        </div>
        
        </div>
    </nav>

    <!-- Register Content -->
    <main class="flex-grow flex items-center justify-center py-2 px-4 sm:px-6 lg:px-8 bg-gradient-to-br from-teal-400 to-cyan-500">
        <div class="max-w-md w-full space-y-8 bg-white p-8 rounded-2xl shadow-xl border border-gray-100">
            <div class="text-center">
                <h2 class="mt-2 text-3xl font-extrabold text-gray-900 tracking-tight">
                    Create Account
                </h2>
                <p class="mt-2 text-sm text-gray-500">
                    Join HealHub today
                </p>
            </div>

            <form action="RegisterServlet" method="post" class="mt-8 space-y-6">
                <div class="rounded-md shadow-sm">
                    <div class="relative mb-1">
                        
                        <input id="name" name="name" type="text" required class="appearance-none rounded-md relative block w-full px-10 py-3 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-teal-500 focus:border-teal-500 focus:z-10 sm:text-sm" placeholder="Full Name">
                    </div>
                    <div class="relative mb-1">
                        
                        <input id="email" name="email" type="text" required class="appearance-none rounded-md relative block w-full px-10 py-3 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-teal-500 focus:border-teal-500 focus:z-10 sm:text-sm" placeholder="Email Address">
                    </div>
                    <div class="relative mb-1">
                        
                        <input id="password" name="password" type="password" required class="appearance-none rounded-md relative block w-full px-10 py-3 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-teal-500 focus:border-teal-500 focus:z-10 sm:text-sm" placeholder="Create Password">
                    </div>
                     <div class="relative mb-1">
                        
                        <input id="confirmPassword" name="confirmPassword" type="password" required class="appearance-none rounded-md relative block w-full px-10 py-3 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-teal-500 focus:border-teal-500 focus:z-10 sm:text-sm" placeholder="Confirm Password">
                    </div>
                </div>
                
                <!-- Password Requirements -->
                <div class="text-xs text-gray-500 space-y-1">
                    <p>Password must contain:</p>
                    <ul class="list-disc list-inside pl-2 space-y-0.5">
                        <li>At least 8 characters</li>
                        <li>At least one uppercase letter</li>
                        <li>At least one number</li>
                    </ul>
                </div>

                <div class="flex items-center">
                    <input id="terms" name="terms" type="checkbox" required class="h-4 w-4 text-teal-600 focus:ring-teal-500 border-gray-300 rounded">
                    <label for="terms" class="ml-2 block text-sm text-gray-900">
                        I agree to the <a href="javascript:void(0)" onclick="openPopup()" class="text-teal-600 hover:text-teal-500">Terms and Conditions</a>
                    </label>
                </div>
                
                <!-- Popup -->
<div id="termsPopup"
     class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">

    <div class="bg-white w-[90%] max-w-lg rounded-xl p-6 relative shadow-lg">

        <!-- Close Button -->
        <span onclick="closePopup()"
              class="absolute top-2 right-4 text-3xl cursor-pointer text-red-500">
            &times;
        </span>

        <h2 class="text-2xl font-bold text-teal-600 mb-4">
            Terms and Conditions
        </h2>

        <div class="text-gray-700 text-sm space-y-3">

            <p>
                Welcome to HealHub. By using this platform, you agree to follow our terms and conditions.
            </p>

            <ul class="list-disc pl-5 space-y-2">
                <li>User information must be correct and valid.</li>
                <li>Medicine availability depends on pharmacy stock updates.</li>
                <li>Users should not misuse pharmacy or medicine data.</li>
                <li>HealHub is only for informational purposes.</li>
                <li>Unauthorized access or misuse is prohibited.</li>
                
            </ul>
            <p style="font-size: smaller">&copy; 2026 HealHub. All rights reserved.</p>

        </div>

    </div>
</div>
                <script>



</script>

                <button type="submit" class="group relative w-full flex justify-center py-3 px-4 border border-transparent text-sm font-medium rounded-lg text-white bg-teal-600 hover:bg-teal-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-teal-500 transition-colors shadow-lg shadow-teal-100">
                    <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                        <i data-lucide="arrow-right" class="h-5 w-5 text-teal-500 group-hover:text-teal-400"></i>
                    </span>
                    <span id="submit-text">Register Now</span>
                </button>
            </form>
            
            <div class="text-center mt-4">
                <p class="text-sm text-gray-600">
                    Already have an account? <a href="login.jsp" class="font-medium text-teal-600 hover:text-teal-500">Sign in</a>
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
        
       function openPopup()
        {
            document.getElementById("termsPopup").classList.remove("hidden");
        }

        function closePopup()
        {
            document.getElementById("termsPopup").classList.add("hidden");
        }

        window.onclick = function(event)
        {
            let popup = document.getElementById("termsPopup");

            if(event.target === popup)
            {
                popup.classList.add("hidden");
            }
        };
    </script>
</body>
</html>
