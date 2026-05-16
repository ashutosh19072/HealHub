<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HealHub - Reset Password</title>
    <link rel="icon" type="image/png" href="favicon.png">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style> body { font-family: 'Inter', sans-serif; } </style>
</head>
<body class="flex flex-col min-h-screen bg-gray-50">
    
     <%
            HttpSession mySession = request.getSession();
            
            String email = (String)mySession.getAttribute("email4forget");
            
            if(email==null || email.trim().equals(""))
            {
                response.sendRedirect("index.jsp");
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
               
            </div>
        </div>
        
    </nav>

    <!-- Reset Password Content -->
    <main class="flex-grow flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8 bg-gradient-to-br from-teal-400 to-cyan-500">
        <div class="max-w-md w-full bg-white p-10 rounded-2xl shadow-2xl">
            <!-- Header -->
            <div class="text-center mb-8">
                <h2 class="text-3xl font-extrabold text-gray-900 tracking-tight">
                    Reset Password
                </h2>
            </div>

            <!-- Reset Password Form -->
            <form class="space-y-5" onsubmit="handleResetPassword()" action="SetNewPasswordServlet" method="post">
                <!-- New Password -->
                <div class="relative">
                    <div class="absolute top-3.5 left-3 flex items-center pointer-events-none">
                        <i data-lucide="key" class="h-5 w-5 text-gray-400"></i>
                    </div>
                    <input
                        id="new-password"
                        name="new-password"
                        type="password"
                        required
                        minlength="8"
                        class="appearance-none block w-full pl-10 pr-4 py-3.5 border border-gray-300 rounded-lg placeholder-gray-400 text-gray-900 focus:outline-none focus:ring-teal-500 focus:border-teal-500 sm:text-sm"
                        placeholder="New Password"
                    >
                </div>

                <!-- Confirm New Password -->
                <div class="relative">
                    <div class="absolute top-3.5 left-3 flex items-center pointer-events-none">
                        <i data-lucide="key" class="h-5 w-5 text-gray-400"></i>
                    </div>
                    <input
                        id="confirm-password"
                        name="confirm-password"
                        type="password"
                        required
                        minlength="8"
                        class="appearance-none block w-full pl-10 pr-4 py-3.5 border border-gray-300 rounded-lg placeholder-gray-400 text-gray-900 focus:outline-none focus:ring-teal-500 focus:border-teal-500 sm:text-sm"
                        placeholder="Confirm New Password"
                    >
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

                <!-- Reset Button -->
                <div class="pt-2">
                    <button
                        type="submit"
                        class="w-full flex justify-center py-3.5 px-4 border border-transparent text-sm font-medium rounded-lg text-white bg-teal-600 hover:bg-teal-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-teal-500 transition-colors shadow-md"
                    >
                        Reset
                    </button>
                </div>
            </form>

            <!-- Register Link -->
            <div class="mt-8 pt-6 border-t border-gray-200">
                <p class="text-center text-sm text-gray-700">
                    Don't have an Account? 
                    <a href="register.jsp" class="font-medium text-teal-600 hover:text-red-500">
                        Register Now!
                    </a>
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

        

        function handleResetPassword() {
           
            
            const newPassword = document.getElementById('new-password').value;
            const confirmPassword = document.getElementById('confirm-password').value;

            // Check if passwords match
            if (newPassword !== confirmPassword) {
                alert('Passwords do not match! Please try again.');
                return;
            }

            // Validate password strength
            const hasUpperCase = /[A-Z]/.test(newPassword);
            const hasNumber = /[0-9]/.test(newPassword);
            const hasMinLength = newPassword.length >= 8;

            if (!hasUpperCase || !hasNumber || !hasMinLength) {
                alert('Password does not meet the requirements. Please ensure it has:\n- At least 8 characters\n- At least one uppercase letter\n- At least one number');
                return;
            }

            alert('Password reset successful!\n\nYou can now login with your new password.');

            
        }

        // Auto-focus on new password input when page loads
        window.addEventListener('load', function() {
            document.getElementById('new-password').focus();
        });
    </script>
</body>
</html>

