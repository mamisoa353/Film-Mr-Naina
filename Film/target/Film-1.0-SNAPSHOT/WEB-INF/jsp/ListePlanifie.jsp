<%-- 
    Document   : ListeFilms
    Created on : 28 févr. 2023, 22:51:21
    Author     : 26132
--%>

<%@page import="com.idealy.articles.model.Scene_Personnage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.idealy.articles.model.Film"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Scene_Personnage> pers = (ArrayList<Scene_Personnage>) request.getAttribute("liste");
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
                            liste des films
                        </a>
                    </li>
                </ul>
                <a href="https://templatedeck.com/klar-html-template.html" aria-label="Download this template"
                   class="btn btn-outline-light">
                    <small>telecharger l'apps</small>
                </a>
            </div>
        </nav>
        <main style="">
            <div class="container">
                <h1>Liste planifie!</h1>
                
              <!--///////////////////////////////-->  
             
        <!--//////////////////////////////////////-->
                
                <div class="bg-dark py-vh-5">
                    <div class="container px-vw-5">
                        <% for (int i = 0; i < pers.size(); i++) {
                            Scene_Personnage temp = pers.get(i);
                        %> 
                
                   
                            <div class="row d-flex gx-5 align-items-center">
                                <div class="col-12 col-lg-6">
                                    <div class="rounded-5 bg-black p-5 shadow mt-5" data-aos="zoom-in-left">
                                     <p>Personnage <%=temp.getPersonnageidPersonnage()%></p>
                                        <div class="fs-1">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                                 class="bi bi-star-fill" viewBox="0 0 16 16">
                                            <path
                                                d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                            </svg>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                                 class="bi bi-star-fill" viewBox="0 0 16 16">
                                            <path
                                                d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                            </svg>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                                 class="bi bi-star-fill" viewBox="0 0 16 16">
                                            <path
                                                d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                            </svg>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                                 class="bi bi-star-fill" viewBox="0 0 16 16">
                                            <path
                                                d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                            </svg>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                                 class="bi bi-star-fill" viewBox="0 0 16 16">
                                            <path
                                                d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                            </svg>
                                        </div>
                                        <p>Plateau = <%=temp.getIdPlateau()%></p>
                                        <div class="d-flex justify-content-start align-items-center border-top pt-3">
                                            <div>
                                                <b><span class="h6 fw-5"> <p>Text : <%=temp.getText()%> </p></span><br>
                                                </b><small>COO, The Boo Corp.</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div></a>
                            <% }%>
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
text-secondary lead
lead