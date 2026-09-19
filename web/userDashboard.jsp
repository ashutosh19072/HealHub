<%@page import="model.Medicine"%>
<%@page import="dao.MedicineDAO"%>
<%@page import="model.Pharmacy"%>
<%@page import="model.SearchResult"%>
<%@page import="java.util.List"%>
<%@page import="dao.PharmacyDAO"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - HealHub</title>
    
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
        html{
            scroll-behaviour: smooth;
        }
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
            
            UserDAO ud = new UserDAO();
            User u = ud.getData(email);
            String name = u.getUsername();
            
            session.setAttribute("userData", u);
            
            List<SearchResult> list = (List<SearchResult>)request.getAttribute("results");
            
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
                        <a href="userDashboard.jsp" class="flex items-center space-x-3 px-4 py-3 rounded-lg bg-blue-50 text-blue-600 font-medium">
                            <i data-lucide="layout-dashboard" class="w-5 h-5"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="#search" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-gray-50 transition">
                            <i data-lucide="search" class="w-5 h-5"></i>
                            <span>Search Medicine</span>
                        </a>
                    </li>
                    <li>
                        <button onclick="getLocation()" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-gray-50 w-full text-left">
                            <i data-lucide="map-pin" class="w-5 h-5"></i>
                            <span>Nearby Pharmacies</span>
                        </button>
                    </li>
                    <li>
                        <a href="registerPharmacy.jsp" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-gray-50 transition">
                            <i data-lucide="store" class="w-5 h-5"></i>
                            <span>Register Pharmacy</span>
                        </a>
                    </li>
                    <li>
                        <a href="UserManagePharmacy.jsp" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-gray-50 transition">
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
                    <div class="flex items-center space-x-6" style="width: 850px">
                        
                        <marquee behavior="scroll" direction="left" scrollamount="5" class="text-yellow-800 text-sm font-medium">

                        ⚠️ Disclaimer: HealHub is intended for informational purposes only. 
                        Medicine availability and pharmacy information may change in real time. 
                        Please verify details directly with the pharmacy before making healthcare-related decisions. 
                        HealHub does not provide medical advice or guarantee medicine availability.

                        </marquee>
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
            
            <!-- Main Dashboard Content -->
            <main class="flex-1 overflow-y-auto p-8">
                
                <!-- Welcome Section -->
                <div class="mb-8">
                    <h1 class="text-3xl font-bold text-gray-800 mb-2">Welcome, <%=name%></h1>
                    <p class="text-gray-600">Find medicines quickly and easily</p>
                </div>
                
                <!-- Search Section (Prominent) -->
                <form action="SearchMedicineServlet" method="post" id="search">
                <div class="mb-8 bg-teal-500 rounded-2xl shadow-xl p-8" id="sear">
                    <h2 class="text-2xl font-bold text-white mb-6">Search for Medicine</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                        <div>
                            <label class="block text-white text-sm font-medium mb-2" for="mname">Medicine Name</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i data-lucide="pill" class="text-gray-400 w-5 h-5"></i>
                                </div>
                                <input id="mname" name="medicine"
                                    type="text" 
                                    placeholder="Enter medicine name..." required
                                    class="w-full pl-10 pr-4 py-3 rounded-lg border-0 focus:ring-2 focus:ring-white outline-none"
                                >
                            </div>
                        </div>
                        <div>
                            <label class="block text-white text-sm font-medium mb-2" for="location">Location</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i data-lucide="map-pin" class="text-gray-400 w-5 h-5"></i>
                                </div>
                                <input id="location" name="location"
                                    type="text" 
                                    placeholder="Enter your location..."
                                    class="w-full pl-10 pr-4 py-3 rounded-lg border-0 focus:ring-2 focus:ring-white outline-none"
                                >
                            </div>
                        </div>
                    </div>
                    
<!--                            <input type="hidden" id="userLat1" name="userLat1">
                            <input type="hidden" id="userLng2" name="userLng1">-->
                    
                    <button type="submit" class="w-full md:w-auto px-8 py-3 bg-white text-blue-600 font-semibold rounded-lg hover:bg-gray-50 transition flex items-center justify-center space-x-2 shadow-lg">
                        <i data-lucide="search" class="w-5 h-5"></i>
                        <span>Search Medicine</span>
                    </button>
                </div>
                </form>
                

                <% 
                    if(list==null)
                    {
                        %>
                        <div class="bg-white p-6 rounded-lg shadow text-center">
                            <p class="text-gray-600">Click "Nearby Pharmacies" to Locate Nearby Pharmacies</p>
                        </div><br>
                <%
                    }
                    else
                    {   
                %>
                <!-- Search Results Section -->
                <div class="mb-8">
                    <h2 class="text-xl font-bold text-gray-800 mb-4">Search Results</h2>
                    <div class="bg-white rounded-xl shadow-sm border border-gray-100">
                        <div class="overflow-x-auto">
                            
                            <input type="hidden" id="userLat" name="userLat">
                            <input type="hidden" id="userLng" name="userLng">
                            
                            <table class="w-full">
                                <thead class="bg-gray-50 border-b border-gray-200">
                                    <tr>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Pharmacy Name</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Address</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">City</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Medicine</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Availability</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Quantity</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Direction</th>
                                        
                                  
                                    </tr>
                                </thead>
                                
                                <%      
                                        
                                        
                                        
                                        
                                        if(list!=null && !list.isEmpty())
                                        {
                                            for(SearchResult r : list)
                                            {   
                                                String availability = "";
                                            
                                                if(r.getQuantity() <= 0)
                                                {
                                                    availability="red";
                                                }
                                                else if(r.getQuantity() <= 20)
                                                {
                                                    availability="yellow";
                                                }
                                                else
                                                {
                                                    availability="green";
                                                }
                                %>
                                <tbody class="divide-y divide-gray-200">
                                    <tr class="hover:bg-gray-50">
                                        <td class="px-6 py-4">
                                            <div class="flex items-center space-x-3">
                                                <div class="w-10 h-10 bg-blue-100 rounded-lg flex items-center justify-center">
                                                    <i data-lucide="store" class="text-blue-600 w-5 h-5"></i>
                                                </div>
                                                <div>
                                                    <p class="text-sm font-medium text-gray-800"><%= r.getPharmacyName() %></p>
                                                    
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 text-sm text-gray-600"><%= r.getAddress() %></td>
                                        <td class="px-6 py-4 text-sm text-gray-600"><%= r.getCity() %></td>
                                        <td class="px-6 py-4 text-sm text-gray-600"><%= r.getMedicine() %></td>
                                        <td class="px-6 py-4">
                                            <span class="px-3 py-1 text-xs font-medium text-<%=availability%>-700 bg-<%=availability%>-100 rounded-full flex items-center space-x-1 w-fit">
                                                <i data-lucide="check-circle" class="w-3 h-3"></i>
                                                <% if(availability.equals("green")){ %><span>Available</span>
                                                <% } else if(availability.equals("yellow")){ %><span>Low Stock</span>
                                                <% } else { %><span>Out of Stock</span> <%  } %>
                                            </span>
                                        </td>
                                        
                                        <td class="px-6 py-4 text-sm text-gray-600"><%= r.getQuantity() %></td>
                                        
                                        <td class="px-6 py-4">
                                            <button class="w-full py-2 bg-blue-600 text-white text-sm rounded-lg hover:bg-blue-700 transition">
                                <a href="https://www.google.com/maps?q=<%= r.getLatitude() %>,<%= r.getLongitude() %>" 
                                     target="_blank">
                                Get Directions
                                </a>
                            </button>
                                        </td>
                                        
                                    </tr>
                                    
                                    <%
                                        }
                                    } else if(list!=null){
                                    
                                    %>
                                    
                                    <tr>
                                        <td colspan="7" style="text-align: center">
                                            No Results Found
                                        </td>
                                    </tr>
                                    
                                    <% } %>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <% } %>
                
                
                <!-- Nearby Pharmacies Section -->
                
                 <%
                     //List<Pharmacy> nearbyPharmacies = (List<Pharmacy>) request.getAttribute("pharmacyList");
                     
                     List<Pharmacy> nearbyPharmacies = (List<Pharmacy>) session.getAttribute("pharmacyList");
                     
                    
                     
                     if(nearbyPharmacies!=null)
                     {
                     System.out.println("list is not null");
                 }
                 else
                 {
                 System.out.println("list is null");
                 }
                %>
                
                <div id="nearbySection">
                    <h2 class="text-xl font-bold text-gray-800 mb-4">Nearby Pharmacies</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        
                <% if(nearbyPharmacies != null && !nearbyPharmacies.isEmpty()){ %>
                
                        <% for(Pharmacy p:nearbyPharmacies){ %>
                        
                        <!-- Pharmacy Card 1 -->
                        <div class="bg-white rounded-xl shadow-sm border border-gray-100 p-6 hover:shadow-lg transition">
                            <div class="flex items-start justify-between mb-4">
                                <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center">
                                    <i data-lucide="store" class="text-blue-600 w-6 h-6"></i>
                                </div>
                                <span class="px-2 py-1 text-xs font-medium text-green-700 bg-green-100 rounded-full">Open</span>
                            </div>
                            <h3 class="text-lg font-semibold text-gray-800 mb-2"><%= p.getPname() %></h3>
                            <div class="space-y-2 mb-4">
                                <div class="flex items-center space-x-2 text-sm text-gray-600">
                                    <i data-lucide="map-pin" class="w-4 h-4"></i>
                                    <span><%= p.getAddress() %></span>
                                </div>
                                <div class="flex items-center space-x-2 text-sm text-gray-600">
                                    <i data-lucide="navigation" class="w-4 h-4"></i>
                                    <span><%= String.format("%.2f", p.getDistance()) %> km away</span>
                                </div>
                                <div class="flex items-center space-x-2 text-sm text-gray-600">
                                    <i data-lucide="clock" class="w-4 h-4"></i>
                                    <span>Open 11AM - 9PM</span>
                                </div>
                            </div>
                            <button class="w-full py-2 bg-blue-600 text-white text-sm rounded-lg hover:bg-blue-700 transition">
                                <a href="https://www.google.com/maps?q=<%= p.getLatitude() %>,<%= p.getLongitude() %>" 
                                     target="_blank">
                                Get Directions
                                </a>
                            </button>
                        </div>
                        <% 
                            }
                        %>
                       
                        
                    </div>
                        
                        <% } else { %>

                        <div class="bg-white p-6 rounded-lg shadow text-center">
                            <p class="text-gray-600">No Nearby Pharmacies Found</p>
                        </div>

    <% } %>
                </div>
                
            </main>
            
        </div>
        
    </div>
    
    <!-- Initialize Lucide Icons -->
    <script>
        lucide.createIcons();
    </script>
    
    
<script>
window.onload = function () {

    // 🔹 Run location only once
    if (!sessionStorage.getItem("locationFetched")) {

        sessionStorage.setItem("locationFetched", "true");

        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {

                let lat = position.coords.latitude;
                let lng = position.coords.longitude;

                // ✅ store in hidden fields
                document.getElementById("userLat").value = lat;
                document.getElementById("userLng").value = lng;
                
//                document.getElementById("userLat1").value = lat;
//                document.getElementById("userLng1").value = lng;

                // 🔁 existing redirect
                window.location.href = "SearchPharmacyServlet?lat=" + lat + "&lng=" + lng;

            }, function() {
                console.log("Location permission denied");
            });
        }
    }
};
</script>


<script>
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(sendLocation, showError);
    } else {
        alert("Geolocation not supported");
    }
}

function sendLocation(position) {
    let lat = position.coords.latitude;
    let lng = position.coords.longitude;

    window.location.href = "SearchPharmacyServlet?lat=" + lat + "&lng=" + lng;
}

function showError(error) {
    alert("Location permission denied!");
}

function openDirections(destLat, destLng) {

    let userLat = document.getElementById("userLat").value;
    let userLng = document.getElementById("userLng").value;

    if (!userLat || !userLng) {
        alert("Please allow location access first.");
        return;
    }

    let url = "https://www.google.com/maps/dir/?api=1"
            + "&origin=" + userLat + "," + userLng
            + "&destination=" + destLat + "," + destLng
            + "&travelmode=driving";

    window.open(url, "_blank");
}
</script>



    
</body>
</html>

