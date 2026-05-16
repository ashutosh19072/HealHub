
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HealHub - Verify OTP</title>
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
            
            String error = request.getParameter("error");
            
            if(error != null && error.equals("invalid"))
            {
            
      %>
      
      <script>
          alert('Invalid OTP, Try again.')
      </script>
      
      <%   }    %>
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

    <%
        


    %>
    
    <!-- Verify OTP Content -->
    <main class="flex-grow flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8 bg-gradient-to-br from-teal-400 to-cyan-500">
        <div class="max-w-md w-full bg-white p-10 rounded-2xl shadow-xl border border-gray-100">
            <!-- Lock Icon -->
            <div class="flex justify-center mb-6">
                <div class="bg-gray-700 p-5 rounded-full">
                    <i data-lucide="lock" class="h-12 w-12 text-white"></i>
                </div>
            </div>

            <!-- Header -->
            <div class="text-center mb-8">
                <h2 class="text-3xl font-extrabold text-gray-900 tracking-tight">
                    Enter OTP
                </h2>
                <p class="mt-2 text-sm text-gray-500">
                    OTP is sent to your registered email id
                </p>
            </div>

            <!-- OTP Form -->
            <form class="space-y-6" onsubmit="handleeVerifyOTP(event)" action="VerifyOtpServlet" method='post'>
                <div class="relative">
                    <div class="absolute top-3.5 left-3 flex items-center pointer-events-none">
                        <i data-lucide="mail" class="h-5 w-5 text-gray-400"></i>
                    </div>
                    <input
                        id="otp"
                        name="otp"
                        type="text"
                        required
                        maxlength="6"
                        pattern="[0-9]{6}"
                        class="appearance-none block w-full pl-10 pr-4 py-3.5 border border-gray-300 rounded-lg placeholder-gray-400 text-gray-900 focus:outline-none focus:ring-teal-500 focus:border-teal-500 sm:text-sm"
                        placeholder="Enter 6-digit OTP"
                    >
                </div>
                
                <div style="margin-top: 0; padding: 0; font-size: 12px; color: red; display: none; ">
                    <p>Invalid OTP, Try again</p>
                </div>
                
                <div>
                    <button
                        type="submit"
                        class="w-full flex justify-center py-3.5 px-4 border border-transparent text-sm font-medium rounded-lg text-white bg-teal-600 hover:bg-teal-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-colors shadow-md"
                    >
                        Reset Password
                    </button>
                </div>

                <div class="text-center">
                    <a href="login.jsp" class="text-sm font-medium text-gray-600 hover:text-teal-600 transition-colors">
                        <i data-lucide="arrow-left" class="h-4 w-4 inline mr-1"></i>
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
        
        function handleVerifyOTP(e) {
            e.preventDefault();
            const otp = document.getElementById('otp').value;

            // Validate OTP format (6 digits)
            if (!/^\d{6}$/.test(otp)) {
                alert('Please enter a valid 6-digit OTP');
                return;
            }

            // Simulate OTP verification
            alert('OTP Verified Successfully!\n\nYou will now be redirected to reset your password.');

            // In a real application, you would:
            // 1. Send OTP to backend for verification
            // 2. If valid, redirect to reset password page
            // window.location.href = 'reset-password.html?token=' + otp;
        }


        // Auto-focus on OTP input when page loads
        window.addEventListener('load', function() {
            document.getElementById('otp').focus();
        });
    </script>
</body>
</html>

