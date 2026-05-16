<%@page import="java.util.List"%>
<%@page import="model.Pharmacy"%>
<%@page import="dao.UserDAO"%>
<%@page import="dao.PharmacyDAO"%>
<%@page import="dao.MedicineDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBConnector"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>    
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--    <meta http-equiv="refresh" content="5" >-->

    
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
                        <a href="adminDashboard.jsp" class="flex items-center space-x-3 px-4 py-3 rounded-lg bg-blue-50 text-blue-600 font-medium">
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
                        <a href="manageMedicine.jsp" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-gray-50 transition">
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
                            <a href="adminDashboard.jsp" class="text-sm font-medium text-blue-600">Dashboard</a>
                            <a href="managePharmacy.jsp" class="text-sm font-medium text-gray-600 hover:text-blue-600 transition">Manage Pharmacies</a>
                            <a href="manageUsers.jsp" class="text-sm font-medium text-gray-600 hover:text-blue-600 transition">Manage Users</a>
                            <a href="manageMedicine.jsp" class="text-sm font-medium text-gray-600 hover:text-blue-600 transition">Manage Medicines</a>
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
                    <p class="text-gray-600">Manage system data and monitor activity</p>
                </div>
                
                
                <!-- Quick Stats Cards -->
                <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6 mb-8">
                    
                    <!-- Card 1: Pharmacies Registered -->
                    <div class="bg-white rounded-xl shadow-sm p-6 border border-gray-100 hover:shadow-md transition">
                        <div class="flex items-center justify-between mb-4">
                            <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center">
                                <i data-lucide="store" class="text-blue-600 w-6 h-6"></i>
                            </div>
                        </div>
                        <h3 class="text-gray-500 text-sm font-medium mb-1">Pharmacies Registered</h3>
                        <p class="text-3xl font-bold text-gray-800"><%= PharmacyDAO.getApprovedPharmacyCount() %></p>
                        <p class="text-xs text-green-600 mt-2">+2 this week</p>
                    </div>
                    
                    <!-- Card 2: Medicines Available -->
                    <div class="bg-white rounded-xl shadow-sm p-6 border border-gray-100 hover:shadow-md transition">
                        <div class="flex items-center justify-between mb-4">
                            <div class="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center">
                                <i data-lucide="pill" class="text-green-600 w-6 h-6"></i>
                            </div>
                        </div>
                        <h3 class="text-gray-500 text-sm font-medium mb-1">Medicines Available</h3>
                        <p class="text-3xl font-bold text-gray-800"><%= MedicineDAO.getMedicineCount() %></p>
                        <p class="text-xs text-green-600 mt-2">Across all pharmacies</p>
                    </div>
                    
                    <!-- Card 3: users registered -->
                    <div class="bg-white rounded-xl shadow-sm p-6 border border-gray-100 hover:shadow-md transition">
                        <div class="flex items-center justify-between mb-4">
                            <div class="w-12 h-12 bg-gray-100 rounded-lg flex items-center justify-center">
                                <i data-lucide="circle-user" class="text-gray-600 w-6 h-6"></i>
                            </div>
                        </div>
                        <h3 class="text-gray-500 text-sm font-medium mb-1">Users Registered</h3>
                        <p class="text-3xl font-bold text-gray-800"><%= UserDAO.getUserCount() %></p>
                        <p class="text-xs text-green-600 mt-2">Within 5 km radius</p>
                    </div>
                        
                    <!-- Card 4: Pending Approvals -->
                    <div class="bg-white rounded-xl shadow-sm p-6 border border-gray-100 hover:shadow-md transition">
                        <div class="flex items-center justify-between mb-4">
                            <div class="w-12 h-12 bg-yellow-100 rounded-lg flex items-center justify-center">
                                <i data-lucide="hourglass" class="text-yellow-600 w-6 h-6"></i>
                            </div>
                        </div>
                        <h3 class="text-gray-500 text-sm font-medium mb-1">Pending Approvals</h3>
                        <p class="text-3xl font-bold text-gray-800"><%= PharmacyDAO.getPendingPharmacyCount() %></p>
                        <p class="text-xs text-green-600 mt-2">+2 this week</p>
                    </div>    
                    
                </div>
                
                <!-- pending approvals Section -->
                <div class="mb-8">
                    <h2 class="text-xl font-bold text-gray-800 mb-4">Pending Approvals</h2>
                    <div class="bg-white rounded-xl shadow-sm border border-gray-100">
                        <div class="overflow-x-auto">
                            <table class="w-full">
                                <thead class="bg-gray-50 border-b border-gray-200">
                                    <tr>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Pharmacy Name</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Address</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Owner Name</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Contact</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Actions</th>
                                    </tr>
                                </thead>
                                
                                <%
                                
                                    List<Pharmacy> pendingPharmacy = PharmacyDAO.getPendingPharmacy();
                                    
                                    for(Pharmacy p : pendingPharmacy)
                                    {   
                                        int p_id = p.getPharmacyId();
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
                                        <td class="px-6 py-4 text-sm text-gray-600"><%= p.getAddress() %></td>
                                        <td class="px-6 py-4 text-sm text-gray-600"><%= p.getOname() %></td>
                                        <td class="px-6 py-4 text-sm text-gray-600"><%= p.getContact() %></td>
                                        <td class="px-6 py-4">
                                            <div class="flex space-x-2">
        
                                               <form action="<%= request.getContextPath() %>/ValidatePharmacyServlet" method="post">
                                                   <input type="hidden" name="p_id" value="<%=p_id%>"/>
                                                   <input type="hidden" name="action" value="APPROVED"/>
                            
                                                   <button type="submit" class="px-4 py-2 bg-white text-green-500 border-2 border-green-500 text-xs rounded-lg hover:bg-green-500 hover:text-white transition">Approve</button>
                                               </form>

                                               <form action="<%= request.getContextPath() %>/ValidatePharmacyServlet" method="post">
                                                   <input type="hidden" name="p_id" value="<%=p_id%>"/>
                                                   <input type="hidden" name="action" value="REJECTED"/>
            
                                                   <button type="submit" class="px-4 py-2 bg-white text-red-500 border-2 border-red-500 text-xs rounded-lg hover:bg-red-500 hover:text-white transition">Reject</button>
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
            </main>
            
        </div>
        
    </div>
    
    <!-- Initialize Lucide Icons -->
    <script>
        lucide.createIcons();
    </script>
    
</body>
</html>
