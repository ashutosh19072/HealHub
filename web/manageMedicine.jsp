<%@page import="dao.MedicineDAO"%>
<%@page import="model.Medicine"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--    <meta http-equiv="refresh" content="5" >-->

    
    <title>Manage Medicine - HealHub</title>
    
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
                        <a href="adminDashboard.jsp" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-gray-50 transition">
                            <i data-lucide="layout-dashboard" class="w-5 h-5"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="managePharmacy.jsp" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-gray-50 transition">
                            <i data-lucide="store" class="w-5 h-5"></i>
                            <span>Manage Pharmacies</span>
                        </a>
                    </li>
                    <li>
                        <a href="manageUsers.jsp" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-gray-50 transition">
                            <i data-lucide="circle-user" class="w-5 h-5"></i>
                            <span>Manage Users</span>
                        </a>
                    </li>
                    <li>
                        <a href="manageMedicine.jsp" class="flex items-center space-x-3 px-4 py-3 rounded-lg bg-blue-50 text-blue-600 font-medium">
                            <i data-lucide="pill" class="w-5 h-5"></i>
                            <span>Manage Medicines</span>
                        </a>
                    </li>
                    
<!--                    <li>
                        <a href="#" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-gray-50 transition">
                            <i data-lucide="user" class="w-5 h-5"></i>
                            <span>Profile</span>
                        </a>
                    </li>-->
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
                        
<!--                        <nav class="hidden md:flex items-center space-x-6">
                            <a href="adminDashboard.jsp" class="text-sm font-medium text-gray-600 hover:text-blue-600 transition">Dashboard</a>
                            <a href="managePharmacy.jsp" class="text-sm font-medium text-gray-600 hover:text-blue-600 transition">Manage Pharmacies</a>
                            <a href="manageUsers.jsp" class="text-sm font-medium text-gray-600 hover:text-blue-600 transition">Manage Users</a>
                            <a href="manageMedicine.jsp" class="text-sm font-medium text-blue-600">Manage Medicines</a>
                        </nav>-->
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
                    <p class="text-gray-600">Manage Medicine data </p>
                </div>
                
                <!-- Search Results Section -->
                <div class="mb-8">
                    <h2 class="text-xl font-bold text-gray-800 mb-4">Registered Medicines</h2>
                    <div class="bg-white rounded-xl shadow-sm border border-gray-100">
                        <div class="overflow-x-auto">
                            <table class="w-full">
                                <thead class="bg-gray-50 border-b border-gray-200">
                                    <tr>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Medicine ID</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Medicine Name</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Mfc. Company</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Description</th>
                                    </tr>
                                </thead>
                                
                                <%
                                    List<Medicine> allMedicine = MedicineDAO.getAllMedicineName(); 
                                    for(Medicine m : allMedicine)
                                    {   
                                %>
                                
                                <tbody class="divide-y divide-gray-200">
                                    <tr>
                                        <td class="px-6 py-4">
                                            <div class="flex items-center space-x-3">
                                                <div class="w-10 h-10 bg-green-100 rounded-lg flex items-center justify-center">
                                                    <i data-lucide="pill" class="text-green-600 w-5 h-5"></i>
                                                </div>
                                                <div>
                                                    <p class="text-sm font-medium text-gray-800"><%= m.getMedicineId() %></p>
                                                 
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 text-sm text-gray-600"><%= m.getName() %></td>
                                        <td class="px-6 py-4 text-sm text-gray-600"><%= m.getCompany() %></td>
                                        <td class="px-6 py-4 text-sm text-gray-600"><%= m.getDescription() %></td>
                                    
                                    </tr>
                                </tbody>
                                <% } %>
                            </table>
                        </div>
                    </div>
                </div>       
            </main>
            
        </div>
        
    </div>
    
    <!-- Initialize Lucide Icons -->
    <script>
        lucide.createIcons();
    </script>
    
</body>
</html>
