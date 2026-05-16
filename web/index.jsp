<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!--        Default Page


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home | HealHub</title>
        <link rel="stylesheet" href="./style.css" />
    </head>
    <body>
        <div class="welcome">
            <h1>Healhub Home Page</h1>
        </div>
        
        
        <br/><br/>
        
        <a href="login.jsp"><button>Login</button></a>
        
        <a href="register.jsp"><button>Register</button></a>
        
    </body>
</html>-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HealHub - Find Pharmacy</title>
    <link rel="icon" type="image/png" href="favicon.png">
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Lucide Icons -->
    <script src="https://unpkg.com/lucide@latest"></script>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        html{
            scroll-behavior: smooth;
        }
        body{ 
            font-family: 'Inter', sans-serif; 
            }
    </style>
</head>
<body class="flex flex-col min-h-screen bg-gray-50">

    <!-- Navigation Bar -->
    <nav class="bg-white border-b border-gray-100 shadow-sm sticky top-0 z-50">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16">
                <!-- Logo -->
                <div class="flex items-center">
                    <a href="index.html" class="flex-shrink-0 flex items-center gap-2">
                        <div class="bg-teal-500 p-1.5 rounded-lg">
                            <i data-lucide="pill" class="h-6 w-6 text-white"></i>
                        </div>
                        <span class="font-bold text-xl text-gray-900 tracking-tight">HealHub</span>
                    </a>
                </div>
                
                <!-- Desktop Menu -->
                 
                <div class="hidden md:flex items-center space-x-8">
                    <a href="index.jsp" class="text-sm font-medium text-teal-600 transition-colors">Home</a>
                    <a href="#101" class="text-sm font-medium text-gray-500 hover:text-teal-600 transition-colors">About us</a>
                    <a href="#102" class="text-sm font-medium text-gray-500 hover:text-teal-600 transition-colors">Are you a Pharmacy Owner?</a>
                    <a href="#103" class="text-sm font-medium text-gray-500 hover:text-teal-600 transition-colors">Contact us</a>
                </div>

                <!-- Login Button -->
                <div class="hidden md:flex items-center">
                    <a href="register.jsp" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-full shadow-sm text-white bg-teal-600 hover:bg-teal-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-teal-500 transition-all mr-3">
                        Register
                    </a>
                    <a href="login.jsp" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-full shadow-sm text-white bg-teal-600 hover:bg-teal-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-teal-500 transition-all">
                        Login
                    </a>
                </div>

                <!-- Mobile menu button -->
                 <div class="-mr-2 flex items-center md:hidden">
                    <button type="button" onclick="toggleMenu()" class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-teal-500">
                        <span class="sr-only">Open main menu</span>
                        <i data-lucide="menu" class="block h-6 w-6"></i>
                    </button>
                </div>
            </div>
        </div>

        <!-- Mobile Menu (Hidden by default) -->
        <div class="md:hidden hidden" id="mobile-menu">
            <div class="pt-2 pb-3 space-y-1">
                <a href="index.jsp" class="block pl-3 pr-4 py-2 border-l-4 border-teal-500 text-base font-medium bg-teal-50 text-teal-700">Home</a>
                <a href="#101" class="block pl-3 pr-4 py-2 border-l-4 border-transparent text-base font-medium text-gray-500 hover:bg-gray-50 hover:border-gray-300 hover:text-gray-700">About us</a>
                <a href="#102" class="block pl-3 pr-4 py-2 border-l-4 border-transparent text-base font-medium text-gray-500 hover:bg-gray-50 hover:border-gray-300 hover:text-gray-700">Are you a Pharmacy owner?</a>
                <a href="#103" class="block pl-3 pr-4 py-2 border-l-4 border-transparent text-base font-medium text-gray-500 hover:bg-gray-50 hover:border-gray-300 hover:text-gray-700">Contact us</a>
                <a href="login.jsp" class="block pl-3 pr-4 py-2 border-l-4 border-transparent text-base font-medium text-gray-500 hover:bg-gray-50 hover:border-gray-300 hover:text-gray-700">Login</a>
                <a href="register.jsp" class="block pl-3 pr-4 py-2 border-l-4 border-transparent text-base font-medium text-gray-500 hover:bg-gray-50 hover:border-gray-300 hover:text-gray-700">Register</a>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <main class="flex-grow">
        <!-- Hero Section -->
        <section class="relative h-[600px] flex items-center justify-center text-white overflow-hidden">
            <div class="absolute inset-0 bg-black/40 z-10"></div>
            <div class="absolute inset-0 bg-cover bg-center z-0" style="background-image: url('https://images.unsplash.com/photo-1681418290255-a5355089dc6d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtb2Rlcm4lMjBwaGFybWFjeSUyMGludGVyaW9yJTIwY2xlYW4lMjBicmlnaHR8ZW58MXx8fHwxNzcxMzEwNjU0fDA&ixlib=rb-4.1.0&q=80&w=1080');"></div>
            
            <div class="relative z-20 container mx-auto px-4 text-center">
                <h1 class="text-4xl md:text-6xl font-bold mb-6 drop-shadow-md">
                    Find the Medicine You Need, <br/> When You Need It.
                </h1>
                <p class="text-xl md:text-2xl mb-8 max-w-2xl mx-auto drop-shadow-sm text-gray-100">
                    Connect with thousands of local pharmacies instantly. Check stock, compare prices, and get directions.
                </p>

                <!-- Search Box -->
                <div class="bg-white p-4 rounded-xl shadow-2xl max-w-3xl mx-auto flex flex-col md:flex-row gap-4">
                    <div class="flex-1 flex items-center bg-gray-50 rounded-lg px-4 py-3 border border-gray-200">
                        <i data-lucide="map-pin" class="text-teal-500 h-5 w-5 mr-3"></i>
                        <input type="text" placeholder="Enter your location..." class="bg-transparent w-full outline-none text-gray-700 placeholder-gray-400">
                    </div>
                    <div class="flex-1 flex items-center bg-gray-50 rounded-lg px-4 py-3 border border-gray-200">
                        <i data-lucide="search" class="text-teal-500 h-5 w-5 mr-3"></i>
                        <input type="text" placeholder="Search for medicine (e.g. Paracetamol)..." class="bg-transparent w-full outline-none text-gray-700 placeholder-gray-400">
                    </div>
                    <a href="login.jsp">
                    <button class="bg-teal-600 hover:bg-teal-700 text-white font-semibold py-3 px-8 rounded-lg transition-colors">
                        Search
                    </button></a>
                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section class="py-20 bg-gray-50" id="101">
            <div class="container mx-auto px-4">
                <div class="text-center mb-16">
                    <h2 class="text-3xl font-bold text-gray-900 mb-4">Why Choose HealHub?</h2>
                    <p class="text-gray-600 max-w-2xl mx-auto">
                        We make it simple to find pharmacies and medicines, ensuring you get the best care possible without the hassle.
                    </p>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                    <!-- Feature 1 -->
                    <div class="bg-white p-8 rounded-2xl shadow-sm hover:shadow-md transition-shadow border border-gray-100 text-center">
                        <div class="bg-teal-50 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-6">
                            <i data-lucide="map-pin" class="h-10 w-10 text-teal-600"></i>
                        </div>
                        <h3 class="text-xl font-bold text-gray-900 mb-3">Locate Nearby</h3>
                        <p class="text-gray-600 leading-relaxed">
                            Find the nearest open pharmacy with just a few clicks based on your current location.
                        </p>
                    </div>
                    <!-- Feature 2 -->
                    <div class="bg-white p-8 rounded-2xl shadow-sm hover:shadow-md transition-shadow border border-gray-100 text-center">
                        <div class="bg-teal-50 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-6">
                            <i data-lucide="pill" class="h-10 w-10 text-teal-600"></i>
                        </div>
                        <h3 class="text-xl font-bold text-gray-900 mb-3">Real-time Inventory</h3>
                        <p class="text-gray-600 leading-relaxed">
                            Check if your medicine is in stock before you leave your home. Save time and effort.
                        </p>
                    </div>
                    <!-- Feature 3 -->
                    <div class="bg-white p-8 rounded-2xl shadow-sm hover:shadow-md transition-shadow border border-gray-100 text-center">
                        <div class="bg-teal-50 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-6">
                            <i data-lucide="shield-check" class="h-10 w-10 text-teal-600"></i>
                        </div>
                        <h3 class="text-xl font-bold text-gray-900 mb-3">Trusted Pharmacies</h3>
                        <p class="text-gray-600 leading-relaxed">
                            All listed pharmacies are verified and licensed, ensuring you get authentic medicines.
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Call to Action -->
        <section class="py-20 bg-white" id="102">
            <div class="container mx-auto px-4">
                <div class="flex flex-col md:flex-row items-center gap-12">
                    <div class="md:w-1/2">
                        <img src="https://images.unsplash.com/photo-1576091358783-a212ec293ff3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxwaGFybWFjaXN0JTIwaGVscGluZyUyMGN1c3RvbWVyJTIwc21pbGluZ3xlbnwxfHx8fDE3NzEzMTgxNTV8MA&ixlib=rb-4.1.0&q=80&w=1080" alt="Pharmacist helping customer" class="rounded-2xl shadow-2xl object-cover h-[500px] w-full">
                    </div>
                    <div class="md:w-1/2 space-y-6">
                        <h2 class="text-3xl md:text-4xl font-bold text-gray-900">
                            Are you a Pharmacy Owner?
                        </h2>
                        <p class="text-lg text-gray-600">
                            Join our network to reach more customers. Manage your inventory, update stock in real-time, and grow your business with HealHub.
                        </p>
                        <ul class="space-y-4">
                            <li class="flex items-center text-gray-700">
                                <div class="bg-green-100 p-1 rounded-full mr-3">
                                    <i data-lucide="check" class="h-4 w-4 text-green-600"></i>
                                </div>
                                Reach thousands of local customers
                            </li>
                            <li class="flex items-center text-gray-700">
                                <div class="bg-green-100 p-1 rounded-full mr-3">
                                    <i data-lucide="check" class="h-4 w-4 text-green-600"></i>
                                </div>
                                Easy-to-use inventory management
                            </li>
                            <li class="flex items-center text-gray-700">
                                <div class="bg-green-100 p-1 rounded-full mr-3">
                                    <i data-lucide="check" class="h-4 w-4 text-green-600"></i>
                                </div>
                                Real-time analytics and insights
                            </li>
                            <li class="flex items-center text-gray-700">
                                <div class="bg-green-100 p-1 rounded-full mr-3">
                                    <i data-lucide="check" class="h-4 w-4 text-green-600"></i>
                                </div>
                                24/7 Support
                            </li>
                        </ul>
                        <div class="pt-4">
                            <a href="register.jsp" class="inline-block bg-teal-600 text-white font-semibold py-3 px-8 rounded-lg hover:bg-teal-700 transition-colors shadow-lg shadow-teal-200">
                                Register Your Pharmacy
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer class="bg-slate-900 text-slate-300" id="103">
        <div class="max-w-7xl mx-auto px-4 py-12 sm:px-6 lg:px-8">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
                <div class="space-y-4">
                    <div class="flex items-center gap-2 text-white">
                        <i data-lucide="pill" class="h-6 w-6 text-teal-400"></i>
                        <span class="text-xl font-bold">HealHub</span>
                    </div>
                    <p class="text-sm leading-relaxed max-w-xs">
                        Connecting you with trusted pharmacies nearby. Find medicines, check availability, and stay healthy.
                    </p>
                </div>
                
                <div>
                    <h3 class="text-white font-semibold mb-4">Quick Links</h3>
                    <ul class="space-y-2 text-sm">
                        <li><a href="#" class="hover:text-teal-400 transition-colors">Find a Pharmacy</a></li>
                        <li><a href="#" class="hover:text-teal-400 transition-colors">Search Medicines</a></li>
                        <li><a href="#" class="hover:text-teal-400 transition-colors">Register Pharmacy</a></li>
                        <li><a href="#" class="hover:text-teal-400 transition-colors">About Us</a></li>
                    </ul>
                </div>

                <div>
                    <h3 class="text-white font-semibold mb-4">Support</h3>
                    <ul class="space-y-2 text-sm">
                        <li><a href="#" class="hover:text-teal-400 transition-colors">Help Center</a></li>
                        <li><a href="#" class="hover:text-teal-400 transition-colors">Privacy Policy</a></li>
                        <li><a href="#" class="hover:text-teal-400 transition-colors">Terms of Service</a></li>
                        <li><a href="#" class="hover:text-teal-400 transition-colors">Contact Support</a></li>
                    </ul>
                </div>

                <div>
                    <h3 class="text-white font-semibold mb-4">Contact Us</h3>
                    <ul class="space-y-3 text-sm">
                        <li class="flex items-center gap-2">
                            <i data-lucide="map-pin" class="h-4 w-4 text-teal-400"></i>
                            <span>45-C Rajendra Nagar, Indore MP 452012</span>
                        </li>
                        <li class="flex items-center gap-2">
                            <i data-lucide="phone" class="h-4 w-4 text-teal-400"></i>
                            <span>+91 8223001765</span>
                        </li>
                        <li class="flex items-center gap-2">
                            <i data-lucide="mail" class="h-4 w-4 text-teal-400"></i>
                            <span>support@healhub.com</span>
                        </li>
                    </ul>
                </div>
            </div>
            
            <div class="border-t border-slate-800 mt-12 pt-8 flex flex-col md:flex-row justify-between items-center text-xs">
                <p>&copy; 2026 HealHub. All rights reserved.</p>
                <div class="flex items-center gap-1 mt-2 md:mt-0">
                    <span>Made with</span>
                    <i data-lucide="heart" class="h-3 w-3 text-red-500 fill-current"></i>
                    <span>for better health.</span>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scripts -->
    <script>
        // Initialize Lucide Icons
        lucide.createIcons();

        // Mobile Menu Toggle
        function toggleMenu() {
            const menu = document.getElementById('mobile-menu');
            if (menu.classList.contains('hidden')) {
                menu.classList.remove('hidden');
            } else {
                menu.classList.add('hidden');
            }
        }
    </script>
</body>
</html>
