<%-- 
    Document   : DetailFilm
    Created on : 28 févr. 2023, 23:00:24
    Author     : 26132
--%>

<%@page import="com.idealy.articles.model.Scene"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    List<Scene> sc = (List<Scene>) request.getAttribute("ListesScene");
    System.out.println("Size = ");

    String id = request.getParameter("id");
    if (id == null) {
        System.out.println(request.getAttribute("id"));
        id = (request.getAttribute("id").toString());
        System.out.println("iddd" + id);
    }


%>
<!doctype html>
<html class="h-100" lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
        <meta name="description" content="A well made and handcrafted Bootstrap 5 template">
        <link rel="apple-touch-icon" sizes="180x180" href="img/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="img/favicon-16x16.png">
        <link rel="icon" type="image/png" sizes="96x96" href="img/favicon.png">
        <meta name="author" content="Holger Koenemann">
        <meta name="generator" content="Eleventy v2.0.0">
        <meta name="HandheldFriendly" content="true">
        <title>About</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme.min.css">

        <style>
            /* inter-300 - latin */
            @font-face {
                font-family: 'Inter';
                font-style: normal;
                font-weight: 300;
                font-display: swap;
                src: local(''),
                    url('fonts/inter-v12-latin-300.woff2') format('woff2'),
                    /* Chrome 26+, Opera 23+, Firefox 39+ */
                    url('fonts/inter-v12-latin-300.woff') format('woff');
                /* Chrome 6+, Firefox 3.6+, IE 9+, Safari 5.1+ */
            }

            /* inter-400 - latin */
            @font-face {
                font-family: 'Inter';
                font-style: normal;
                font-weight: 400;
                font-display: swap;
                src: local(''),
                    url('fonts/inter-v12-latin-regular.woff2') format('woff2'),
                    /* Chrome 26+, Opera 23+, Firefox 39+ */
                    url('fonts/inter-v12-latin-regular.woff') format('woff');
                /* Chrome 6+, Firefox 3.6+, IE 9+, Safari 5.1+ */
            }

            @font-face {
                font-family: 'Inter';
                font-style: normal;
                font-weight: 500;
                font-display: swap;
                src: local(''),
                    url('fonts/inter-v12-latin-500.woff2') format('woff2'),
                    /* Chrome 26+, Opera 23+, Firefox 39+ */
                    url('fonts/inter-v12-latin-500.woff') format('woff');
                /* Chrome 6+, Firefox 3.6+, IE 9+, Safari 5.1+ */
            }

            @font-face {
                font-family: 'Inter';
                font-style: normal;
                font-weight: 700;
                font-display: swap;
                src: local(''),
                    url('fonts/inter-v12-latin-700.woff2') format('woff2'),
                    /* Chrome 26+, Opera 23+, Firefox 39+ */
                    url('fonts/inter-v12-latin-700.woff') format('woff');
                /* Chrome 6+, Firefox 3.6+, IE 9+, Safari 5.1+ */
            }
        </style>


    </head>

    <body class="bg-black text-white mt-0" data-bs-spy="scroll" data-bs-target="#navScroll">

        <nav id="navScroll" class="navbar navbar-dark bg-black fixed-top px-vw-5" tabindex="0">
            <div class="container">
                <a class="navbar-brand pe-md-4 fs-4 col-12 col-md-auto text-center" href="index.html">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-stack"
                         viewBox="0 0 16 16">
                    <path
                        d="m14.12 10.163 1.715.858c.22.11.22.424 0 .534L8.267 15.34a.598.598 0 0 1-.534 0L.165 11.555a.299.299 0 0 1 0-.534l1.716-.858 5.317 2.659c.505.252 1.1.252 1.604 0l5.317-2.66zM7.733.063a.598.598 0 0 1 .534 0l7.568 3.784a.3.3 0 0 1 0 .535L8.267 8.165a.598.598 0 0 1-.534 0L.165 4.382a.299.299 0 0 1 0-.535L7.733.063z" />
                    <path
                        d="m14.12 6.576 1.715.858c.22.11.22.424 0 .534l-7.568 3.784a.598.598 0 0 1-.534 0L.165 7.968a.299.299 0 0 1 0-.534l1.716-.858 5.317 2.659c.505.252 1.1.252 1.604 0l5.317-2.659z" />
                    </svg>
                    <span class="ms-md-1 mt-1 fw-bolder me-md-5">FilmHub</span>
                </a>

                <ul class="navbar-nav mx-auto mb-2 mb-lg-0 list-group list-group-horizontal">
                    <li class="nav-item">
                        <a class="nav-link fs-5" href="index.html" aria-label="Homepage">
                            Acceuil
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fs-5" href="content.html" aria-label="A sample content page">
                            Detail du Film
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fs-5" href="Planing?id=<%=id%>" aria-label="A sample content page">
                            Planing
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fs-5" href="AddScene?id=<%=id%>" aria-label="A sample content page">
                            Insert Scene
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fs-5" href="ScenePlanifie?idScene=<%=id%>" aria-label="A sample content page">
                            Liste Scene planifie
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fs-5" href="map.html" aria-label="A sample content page">
                            Map plateau
                        </a>
                    </li>
                </ul>
                <a href="https://templatedeck.com/klar-html-template.html" aria-label="Download this template"
                   class="btn btn-outline-light">
                    <small>telecharger l'apps</small>
                </a>
            </div>
        </nav>

        <main>
            <div class="container">
                <% for (int i = 0; i < sc.size(); i++) {%>
                <div class="row d-flex justify-content-center py-vh-5 pb-0">
                    <div class="col-12 col-lg-10 col-xl-8">
                        <div class="row d-flex align-items-start" data-aos="fade-right">
                            <div class="col-12 col-lg-7">
                                <a href="DetailScene?idScene=<%=sc.get(i).getIdscene()%>" style="text-decoration: none;color: white"> <h2 class="h3 mt-5 border-top pt-5"> <%=sc.get(i).getNumero()%>. <%=sc.get(i).getNomScene()%></h2></a>
                                <p class="text-secondary">
                                    <%=sc.get(i).getResume()%>
                                </p>
                            </div>
                            <div class="col-12 col-lg-4 offset-lg-1 bg-gray-900 p-5 mt-5">
                                <h3 class="h6"></h3>
                                <img style="width:200%;" src="${pageContext.request.contextPath}/resources/image/<%=sc.get(i).getPhoto()%>"/>
                            </div>
                        </div>
                    </div>
                </div>
                <% }%>
            </div>
            <div class="row d-flex justify-content-center py-vh-5 pb-0">
                <div class="col-12 col-lg-10 col-xl-8">
                    <div class="row d-flex align-items-start" data-aos="fade-right">
                        <div class="col-12 col-lg-7">
                            <p class="text-secondary">

                            </p>
                        </div>
                        <form action="AddScene" method="POST">
                            <input type="hidden" name="idfilm" value="<%=id %>">
                            <p>Titre scene :<input type="text" name="titre"></p>
                            <p>Numero scene :<input type="text" name="numero"></p>
                            <p>Resume scene :<input type="text" name="resume"></p>
                            <p>Photo scene :<input type="text" name="photo"></p>
                            <p> <input type="submit" name="Valider"></p>
                        </form>
                    </div>
                </div>
            </div>

        </main>

        <footer class="bg-black border-top border-dark">
            <div class="container py-vh-4 text-secondary fw-lighter">
                <div class="row">
                    <div class="col-12 col-lg-5 py-4 text-center text-lg-start">
                        <a class="navbar-brand pe-md-4 fs-4 col-12 col-md-auto text-center" href="index.html">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-stack"
                                 viewBox="0 0 16 16">
                            <path
                                d="m14.12 10.163 1.715.858c.22.11.22.424 0 .534L8.267 15.34a.598.598 0 0 1-.534 0L.165 11.555a.299.299 0 0 1 0-.534l1.716-.858 5.317 2.659c.505.252 1.1.252 1.604 0l5.317-2.66zM7.733.063a.598.598 0 0 1 .534 0l7.568 3.784a.3.3 0 0 1 0 .535L8.267 8.165a.598.598 0 0 1-.534 0L.165 4.382a.299.299 0 0 1 0-.535L7.733.063z" />
                            <path
                                d="m14.12 6.576 1.715.858c.22.11.22.424 0 .534l-7.568 3.784a.598.598 0 0 1-.534 0L.165 7.968a.299.299 0 0 1 0-.534l1.716-.858 5.317 2.659c.505.252 1.1.252 1.604 0l5.317-2.659z" />
                            </svg>
                            <span class="ms-md-1 mt-1 fw-bolder me-md-5">FilmHub</span>
                        </a>

                    </div>
                    <div class="col border-end border-dark">
                        <span class="h6">Membre</span>
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a href="#" class="link-fancy link-fancy-light">ETU 1384</a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="link-fancy link-fancy-light">ETU 1489</a>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="link-fancy link-fancy-light">ETU 1438</a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="link-fancy link-fancy-light">ETU 1503</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="container text-center small py-vh-2 border-top border-dark">Made by
                <a href="https://templatedeck.com" class="link-fancy link-fancy-light" target="_blank">templatedeck.com</a>
                Distributed by <a href="https://themewagon.com" class="link-fancy link-fancy-light" target="_blank">ThemeWagon</a>
            </div>
        </footer>








        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>
        <script>
            AOS.init({
                duration: 800, // values from 0 to 3000, with step 50ms
            });
        </script>
        <script>
            let scrollpos = window.scrollY;
            const header = document.querySelector(".navbar");
            const header_height = header.offsetHeight;

            const add_class_on_scroll = () => header.classList.add("scrolled", "shadow-sm");
            const remove_class_on_scroll = () => header.classList.remove("scrolled", "shadow-sm");

            window.addEventListener('scroll', function () {
                scrollpos = window.scrollY;

                if (scrollpos >= header_height) {
                    add_class_on_scroll();
                } else {
                    remove_class_on_scroll();
                }

                console.log(scrollpos);
            })
        </script>

    </body>

</html>
