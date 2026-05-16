<%@page import="java.util.List"%>
<%@page import="model.Pharmacy"%>
<%@page import="dao.PharmacyDAO"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>       
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Pharmacy - HealHub</title>
    
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
            
            int i=1;
            
            if(email==null || email.trim().equals(""))
            {
                response.sendRedirect("login.jsp");
            }
           
        
            User u = (User)session.getAttribute("userData");
            String name = u.getUsername();
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
                        <a href="userDashboard.jsp" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-gray-50 transition">
                            <i data-lucide="layout-dashboard" class="w-5 h-5"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-gray-50 transition">
                            <i data-lucide="search" class="w-5 h-5"></i>
                            <span>Search Medicine</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-gray-50 transition">
                            <i data-lucide="map-pin" class="w-5 h-5"></i>
                            <span>Nearby Pharmacies</span>
                        </a>
                    </li>
                    <li>
                        <a href="registerPharmacy.jsp" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-gray-50 transition">
                            <i data-lucide="store" class="w-5 h-5"></i>
                            <span>Register Pharmacy</span>
                        </a>
                    </li>
                    <li>
                        <a href="UserManagePharmacy.jsp" class="flex items-center space-x-3 px-4 py-3 rounded-lg bg-blue-50 text-blue-600 font-medium">
                            <i data-lucide="building-2" class="w-5 h-5"></i>
                            <span>My Pharmacy</span>
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
                        
                        <nav class="hidden md:flex items-center space-x-6">
                            <a href="userDashboard.jsp" class="text-sm font-medium text-gray-600 hover:text-blue-600 transition">Dashboard</a>
                            <a href="#" class="text-sm font-medium text-gray-600 hover:text-blue-600 transition">Search Medicine</a>
                            <a href="registerPharmacy.jsp" class="text-sm font-medium text-gray-600 hover:text-blue-600 transition">Register Pharmacy</a>
                            <a href="UserManagePharmacy.jsp" class="text-sm font-medium text-blue-600">My Pharmacy</a>
                        </nav>
                    </div>
                    
                    <div class="flex items-center space-x-4">
                        <!-- Profile & Logout -->
                        <div class="flex items-center space-x-3">
                            <div class="w-10 h-10 bg-black rounded-full flex items-center justify-center">
                                <i data-lucide="user" class="text-white w-5 h-5"></i>
                            </div>
                            <div class="text-right hidden sm:block">
                                <p class="text-sm font-medium text-gray-800"><%=name%></p>
                                <p class="text-xs text-gray-500"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
                                
                                
            <main class="flex-1 overflow-y-auto p-8">
            <div class="mb-8">
                    <h2 class="text-xl font-bold text-gray-800 mb-4">Approved Pharmacy</h2>
                    <div class="bg-white rounded-xl shadow-sm border border-gray-100">
                        <div class="overflow-x-auto">
                            <table class="w-full">
                                <thead class="bg-gray-50 border-b border-gray-200">
                                    <tr>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Pharmacy Name</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Owner Name</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Address</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Contact</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Action</th>
                                    </tr>
                                </thead>
                                
                                <%
                                    List<Pharmacy> approvedPharmacy = PharmacyDAO.getApprovedPharmacy(email);
                                    
                                    for(Pharmacy p : approvedPharmacy)
                                    {   
                                        
                                %>
                                
                                <tbody class="divide-y divide-gray-200">
                                    <tr>
                                        <td class="px-6 py-4">
                                            <div class="flex items-center space-x-3">
                                                <div class="w-10 h-10 bg-green-100 rounded-lg flex items-center justify-center">
                                                    <i data-lucide="store" class="text-green-600 w-5 h-5"></i>
                                                </div>
                                                <div>
                                                    <p class="text-sm font-medium text-gray-800"><%= p.getPname() %></p>
                                                    <p class="text-xs text-gray-500">Open 24/7</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 text-sm text-gray-600"><%= p.getOname() %></td>
                                        <td class="px-6 py-4 text-sm text-gray-600"><%= p.getAddress() %></td>
                                        <td class="px-6 py-4 text-sm text-gray-600"><%= p.getContact() %></td>
                                        <td class="px-6 py-4">
                                            <div class="flex space-x-2">
        
                                               <form action="pharmacyDashboard.jsp" method="post">
                                                   <input type="hidden" name="pharmacy_id" value="<%= p.getPharmacyId() %>" />
                            
                                                   <button type="submit" class="px-4 py-2 bg-white text-blue-500 border-2 border-blue-500 text-xs rounded-lg hover:bg-blue-500 hover:text-white transition">Manage Pharmacy</button>
                                               </form>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                                <% } %>
                            </table>
                        </div>
                    </div>
                </div> 
                            
                            
                <div class="mb-8">
                    <h2 class="text-xl font-bold text-gray-800 mb-4">Pending Pharmacy</h2>
                    <div class="bg-white rounded-xl shadow-sm border border-gray-100">
                        <div class="overflow-x-auto">
                            <table class="w-full">
                                <thead class="bg-gray-50 border-b border-gray-200">
                                    <tr>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Pharmacy Name</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Owner Name</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Address</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Contact</th>
                                    </tr>
                                </thead>
                                
                                <%
                                    List<Pharmacy> pendingPharmacy = PharmacyDAO.getPendingPharmacy(email);
                                    
                                    for(Pharmacy p : pendingPharmacy)
                                    {   
                                        
                                %>
                                
                                <tbody class="divide-y divide-gray-200">
                                    <tr>
                                        <td class="px-6 py-4">
                                            <div class="flex items-center space-x-3">
                                                <div class="w-10 h-10 bg-yellow-100 rounded-lg flex items-center justify-center">
                                                    <i data-lucide="store" class="text-yellow-600 w-5 h-5"></i>
                                                </div>
                                                <div>
                                                    <p class="text-sm font-medium text-gray-800"><%= p.getPname() %></p>
                                                    <p class="text-xs text-gray-500">Open 24/7</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 text-sm text-gray-600"><%= p.getOname() %></td>
                                        <td class="px-6 py-4 text-sm text-gray-600"><%= p.getAddress() %></td>
                                        <td class="px-6 py-4 text-sm text-gray-600"><%= p.getContact() %></td>
                                        
                                    </tr>
                                </tbody>
                                <% } %>
                            </table>
                        </div>
                    </div>
                </div>            
            </main>
    </div>
    
    <!-- Initialize Lucide Icons -->
    <script>
        lucide.createIcons();
    </script>
    
</body>
</html>
