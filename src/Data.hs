{-# LANGUAGE OverloadedStrings #-}

module Data where

import Resume
import Contact
import Project
import SocialLink
import Role
import Language
import Skill


resume :: Resume
resume = 
  Resume 
    "Pedro Gutiérrez" 
    "Software Developer" 
    (Contact "pedrogutierrez@mac.com" "(34) 645-512-342")
    "Senior Developer with international experience in team leading, product development, concurrent and functional programming, actor systems, network protocols, Erlang/OTP, Java, Javascript, Rest APIs, web development, finite state machines, behaviour driven development and software automation"
    [ (Project "fullpass.in" "Last minute fullpass" "http://www.fullpass.in" "http://github.com/cm/fullpass" "Erlang, Elm" )
    , (Project "weekonekt.com" "A social network for travellers" "http://demo.weekonekt.com" "http://github.com/cm/weekonekt" "Erlang, Elm")
    , (Project "pedrogutierrez.me" "My personal website" "http://pedrogutierrez.me" "http://github.com/cm/pedrogutierrez" "Haskell, Elm") ]
    [ (SocialLink "Github" "http://github.com/cm")
    , (SocialLink "LinkedIn" "http://www.linkedin.com/in/pedrogutierrezruiz")]
    [(Role "Fullstack Developer" "Sequel" "October 2016" "Present" "Malaga" "Insurance" )]
    [(Language "Spanish" "Native")]
    [(Skill "Erlang" "Intermediate")]
