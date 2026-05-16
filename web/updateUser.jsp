<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    
    <title>Admin Dashboard - HealHub</title>
    
    <link rel="icon" type="image/png" href="favicon.png">
    
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Lucide Icons -->
    <script src="https://unpkg.com/lucide@latest"></script>
    
    <style>
        
        body {
            font-family: 'Inter', sans-serif;
            }
    </style>
</head>
<body class="bg-gradient-to-br from-blue-50 to-green-50">
    
     <%
        
            String email = (String)session.getAttribute("email");
            
            if(email==null || email.trim().equals(""))
            {
                response.sendRedirect("login.jsp");
            }
            
            String userEmail = request.getParameter("email");
            User u = UserDAO.getData(userEmail);
            
            session.setAttribute("userid", String.valueOf(u.getUserId()));
            session.setAttribute("userpassword", u.getPassword());
        
        %>
    
    <!-- Main Container -->
    <div class="flex h-screen overflow-hidden">
        
        <!-- Sidebar -->
        <aside class="w-64 bg-white shadow-lg flex flex-col">
            <!-- Logo Section -->
            <div class="p-6 border-b border-gray-200">
                <div class="flex items-center space-x-3">
                    <div class="w-10 h-10 bg-teal-500 p-1.5 rounded-lg flex items-center justify-center">
                        <i data-lucide="pill" class="h-6 w-6 text-white"></i>
                    </div>
                    <div>
                        <h1 class="font-bold text-lg text-gray-800">HealHub</h1>
                        <p class="text-xs text-gray-500">Pharmacy Locator</p>
                    </div>
                </div>
            </div>
            
            <!-- Navigation Menu -->
            <nav class="flex-1 p-4 overflow-y-auto">
                <ul class="space-y-1">
                    <li>
                        <a href="manageUsers.jsp" class="flex items-center space-x-3 px-4 py-3 rounded-lg bg-blue-50 text-blue-600 font-medium">
                            <i data-lucide="undo-2" class="w-5 h-5"></i>
                            <span>Back</span>
                        </a>
                    </li>
                </ul>
            </nav>
            
            <!-- Logout Button -->
            <div class="p-4 border-t border-gray-200">
                <a href="LogoutServlet" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-red-600 hover:bg-red-50 transition">
                    <i data-lucide="log-out" class="w-5 h-5"></i>
                    <span>Logout</span>
                </a>
            </div>
        </aside>
        
        <!-- Main Content Area -->
        <div class="flex-1 flex flex-col overflow-hidden">
            
            <!-- Top Navbar -->
            <header class="bg-white shadow-sm border-b border-gray-200">
                <div class="flex items-center justify-between px-8 py-4">
                    <div class="flex items-center space-x-6">
                        
                        <nav class="hidden md:flex items-center space-x-6">
                            <a href="adminDashboard.jsp" class="text-sm font-medium text-gray-600 hover:text-blue-600 transition">Dashboard</a>
                            <a href="managePharmacy.jsp" class="text-sm font-medium text-gray-600 hover:text-blue-600 transition">Manage Pharmacies</a>
                            <a href="manageUsers.jsp" class="text-sm font-medium text-gray-600 hover:text-blue-600 transition">Manage Users</a>
                            <a href="manageMedicine.jsp" class="text-sm font-medium text-gray-600 hover:text-blue-600 transition">Manage Medicines</a>
                        </nav>
                    </div>
                    
                    <div class="flex items-center space-x-4">
                        <!-- Profile & Logout -->
                        <div class="flex items-center space-x-3">
                            <div class="w-10 h-10 bg-black rounded-full flex items-center justify-center">
                                <i data-lucide="user" class="text-white w-5 h-5"></i>
                            </div>
                            <div class="text-right hidden sm:block">
                                <p class="text-sm font-medium text-gray-800">Admin</p>
                                <p class="text-xs text-gray-500"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            
            <!-- Main Dashboard Content -->
            <main class="flex-1 overflow-y-auto p-8">
                
                <!-- Welcome Section -->
                <div class="mb-8">
                    <h1 class="text-3xl font-bold text-gray-800 mb-2">Welcome, Admin</h1>
                    <p class="text-gray-600">Edit User Details</p>
                </div>
                
                <main class="flex-grow flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
        <div class="max-w-md w-full space-y-8 bg-white p-8 rounded-2xl shadow-xl border border-gray-100">
            <div class="text-center">
                <h2 class="mt-2 text-3xl font-extrabold text-gray-900 tracking-tight">
                   Update Details
                </h2>
                
            </div>

            <form action="UpdateUserServlet" method="post" class="mt-8 space-y-6">
                <div class="rounded-md shadow-sm">
                    <div class="relative mb-1">
                        
                        <input id="name" name="name" type="text" value="<%= u.getUsername() %>"  required class="appearance-none rounded-md relative block w-full px-10 py-3 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-teal-500 focus:border-teal-500 focus:z-10 sm:text-sm">
                    </div>
                    <div class="relative mb-1">
                        
                        <input id="email" name="email" type="text" value="<%= u.getEmail() %>" required class="appearance-none rounded-md relative block w-full px-10 py-3 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-teal-500 focus:border-teal-500 focus:z-10 sm:text-sm">
                        <input type="hidden" name="userid" value="<%= u.getUserId() %>">
                    </div>
                    
                </div>

                

                <button type="submit" class="group relative w-full flex justify-center py-3 px-4 border border-transparent text-sm font-medium rounded-lg text-white bg-teal-600 hover:bg-teal-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-teal-500 transition-colors shadow-lg shadow-teal-100">
                    <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                        <i data-lucide="arrow-right" class="h-5 w-5 text-teal-500 group-hover:text-teal-400"></i>
                    </span>
                    <span id="submit-text">Update Details</span>
                </button>
            </form>
            
            <div class="text-center mt-4">
                <p class="text-sm text-gray-600">
                    Want to Update Password? <a href="updatePassword.jsp" class="font-medium text-teal-600 hover:text-teal-500">Click</a>
                </p>
            </div>
        </div>
    </main>
                
                
                
            </main>
            
        </div>
        
    </div>
    
    <!-- Initialize Lucide Icons -->
    <script>
        lucide.createIcons();
    </script>
    
</body>
</html>
    </body>
</html>
        

