module Library where
import PdePreludat

-- Punto 1
esMultiploDe :: Number -> Number -> Bool
esMultiploDe dividendo divisor = rem dividendo divisor == 0

-- Punto 2
esBisiesto :: Number -> Bool
esBisiesto anio = 
    esMultiploDe anio 400 || 
    esMultiploDe anio 4 && not (esMultiploDe anio 100)


-- Punto 3
cantidadDeDias :: Number -> Number
cantidadDeDias anio | esBisiesto anio = 366
    | otherwise = 365


anioActual :: Number
anioActual = 2024

-- Una persona tiene nombre y anio de nacimiento.
data Persona = UnaPersona {
    nombreDePila :: String,
    anioNac :: Number,
    mascotas :: [Mascota]
} deriving (Show)

-- edad, que dada una persona me diga su edad.
edad :: Persona -> Number
edad alguien = anioActual - anioNac alguien


-- datos de prueba
martin :: Persona
martin = UnaPersona { 
    nombreDePila = "El Marto", 
    anioNac = 1983,
    mascotas = [felipe, nina]
}

-- Saber la inicial de una persona
inicial :: Persona -> Char
inicial = head . nombreDePila
--inicial alguien = head (nombreDePila alguien)

-- Las personas tienen mascotas, de las cuales sabemos su nombre, raza y si están vacunadas.

-- ¿Cómo modelo esto?

data Mascota = UnaMascota {
    nombre :: String,
    raza :: String,
    estaVacunada :: Bool
} deriving (Show)

-- datos de ejemplo
felipe :: Mascota
felipe = UnaMascota { nombre = "Feli", raza = "labrador", estaVacunada = True }

nina :: Mascota
nina = UnaMascota { nombre = "Nina", raza = "golden", estaVacunada = False }

-- Variables de tipo
miConst :: a -> b -> a
miConst x y = x

-- una persona es feliz cuando tiene al menos una mascota

esFeliz :: Persona -> Bool
esFeliz = not . null . mascotas
-- esFeliz alguien = length (mascotas alguien) > 0
