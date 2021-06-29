module Library where
import PdePreludat

--1

data Torta = Torta {
    nombre:: String,
    harina:: Number,
    huevos:: Number,
    calorias:: Number,
    ingredientes:: [Ingredientes]
} deriving Show


type Ingredientes = Torta -> Torta



--2
aumentarCalorias::Number -> Ingredientes
aumentarCalorias calorias torta = torta  {calorias = (calorias $ torta) + calorias}

--a) 
chocolate::Number -> Ingredientes
chocolate gramos torta = aumentarCalorias ((*gramos).huevos $ torta)  torta 


--b)
frutal::String -> Number ->Ingredientes
frutal fruta gramos torta = aumentarCalorias ((/2).(*gramos).(length) $ fruta) $ torta 


--c) 
puñadoDeFrutas::Ingredientes
puñadoDeFrutas torta =  torta  {calorias = calorias torta +  100}

--d)
bañoDeCrema::Ingredientes
bañoDeCrema torta = torta  {calorias = calorias torta +  50 + harina torta}