//
//  LocationsDataService.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 12/04/2022.
//

import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            name: "Empire State Building",
            cityName: "New York City",
            coordinates: CLLocationCoordinate2D(latitude: 40.7484, longitude: -73.985428),
            description: "The Empire State Building is a 102-story[c] Art Deco skyscraper in Midtown Manhattan, New York City. The building was designed by Shreve, Lamb & Harmon and built from 1930 to 1931. Its name is derived from Empire State, the nickname of the state of New York. The building has a roof height of 1,250 feet (380 m) and stands a total of 1,454 feet (443.2 m) tall, including its antenna. The Empire State Building stood as the world's tallest building until the construction of the World Trade Center in 1970; following the latter's collapse in 2001, the Empire State Building was again the city's tallest skyscraper until 2012. As of 2020, the building is the seventh-tallest building in New York City, the ninth-tallest completed skyscraper in the United States, the 49th-tallest in the world, and the sixth-tallest freestanding structure in the Americas.",
            imageNames: [
                "empire-state-1",
                "empire-state-2",
                "empire-state-3",
            ],
            link: "https://en.wikipedia.org/wiki/Empire_State_Building"),
        Location(
            name: "Unisphere",
            cityName: "Queens",
            coordinates: CLLocationCoordinate2D(latitude: 40.7464, longitude: -73.8451),
            description: "The Unisphere is a spherical stainless steel representation of the Earth in Flushing Meadows–Corona Park, in the New York City borough of Queens. The sphere, which measures 140 feet high and 120 feet in diameter, was designed by Gilmore D. Clarke as part of his plan for the 1964 New York World's Fair.",
            imageNames: [
                "unisphere",
            ],
            link: "https://en.wikipedia.org/wiki/Rovinj"),
        Location(
            name: "Railay Beach",
            cityName: "Thailand",
            coordinates: CLLocationCoordinate2D(latitude: 8.0117, longitude: 98.8378),
            description: "Railay Beach in Krabi is located on the Railay Peninsula of the same name and is certainly one of the most spectacular places in all of Thailand. This paradise is especially famous for its imposing limestone cliffs, which together with the turquoise sea, the tall palm trees and the powder-sugar fine white sandy beaches conjure up a true picture-postcard setting. In addition, unforgettable activities and incredibly beautiful attractions await you during a visit on Railay Beach. Climbing, kayaking, snorkeling, hiking and of course swimming at Thailand’s most beautiful beaches are just some of the best things to do. Although the peninsula is no longer an insider tip, Railay Beach is absolutely legendary and a visit is a real must on any trip to Krabi.",
            imageNames: [
                "railay-beach-1",
                "railay-beach-2",
            ],
            link: "https://en.wikipedia.org/wiki/Railay_Beach"),
        Location(
            name: "Bali",
            cityName: "Indonesia",
            coordinates: CLLocationCoordinate2D(latitude: -8.4095, longitude: 115.1889),
            description: "Also known as the Land of the Gods, Bali appeals through its sheer natural beauty of looming volcanoes and lush terraced rice fields that exude peace and serenity. It is also famous for surfers’ paradise! Bali enchants with its dramatic dances and colorful ceremonies, its arts, and crafts, to its luxurious beach resorts and exciting nightlife. And everywhere, you will find intricately carved temples.",
            imageNames: [
                "bali-2",
                "bali-1",
            ],
            link: "https://en.wikipedia.org/wiki/Bali"),
        Location(
            name: "Taj Mahal",
            cityName: "India",
            coordinates: CLLocationCoordinate2D(latitude: 27.1751, longitude: 78.0421),
            description: "The Taj Mahal is located on the right bank of the Yamuna River in a vast Mughal garden that encompasses nearly 17 hectares, in the Agra District in Uttar Pradesh. It was built by Mughal Emperor Shah Jahan in memory of his wife Mumtaz Mahal with construction starting in 1632 AD and completed in 1648 AD, with the mosque, the guest house and the main gateway on the south, the outer courtyard and its cloisters were added subsequently and completed in 1653 AD. The existence of several historical and Quaranic inscriptions in Arabic script have facilitated setting the chronology of Taj Mahal. For its construction, masons, stone-cutters, inlayers, carvers, painters, calligraphers, dome builders and other artisans were requisitioned from the whole of the empire and also from the Central Asia and Iran. Ustad-Ahmad Lahori was the main architect of the Taj Mahal.",
            imageNames: [
                "taj-mahal",
            ],
            link: "https://en.wikipedia.org/wiki/Taj_Mahal"),
        Location(
            name: "Abu Simbel",
            cityName: "Egypt",
            coordinates: CLLocationCoordinate2D(latitude: 22.3372, longitude: 31.6258),
            description: "Abu Simbel, site of two temples built by the Egyptian king Ramses II (reigned 1279–13 BCE), now located in Aswān muḥāfaẓah (governorate), southern Egypt. In ancient times the area was at the southern frontier of pharaonic Egypt, facing Nubia. The four colossal statues of Ramses in front of the main temple are spectacular examples of ancient Egyptian art. By means of a complex engineering feat in the 1960s, the temples were salvaged from the rising waters of the Nile River caused by erection of the Aswan High Dam.",
            imageNames: [
                "abu-simbel",
            ],
            link: "https://en.wikipedia.org/wiki/Abu_Simbel"),
        Location(
            name: "Colosseum",
            cityName: "Rome",
            coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
            description: "The Colosseum is an oval amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum. It is the largest ancient amphitheatre ever built, and is still the largest standing amphitheatre in the world today, despite its age.",
            imageNames: [
                "rome-colosseum-1",
                "rome-colosseum-2",
                "rome-colosseum-3",
            ],
            link: "https://en.wikipedia.org/wiki/Colosseum"),
        Location(
            name: "Pantheon",
            cityName: "Rome",
            coordinates: CLLocationCoordinate2D(latitude: 41.8986, longitude: 12.4769),
            description: "The Pantheon is a former Roman temple and since the year 609 a Catholic church, in Rome, Italy, on the site of an earlier temple commissioned by Marcus Agrippa during the reign of Augustus.",
            imageNames: [
                "rome-pantheon-1",
                "rome-pantheon-2",
                "rome-pantheon-3",
            ],
            link: "https://en.wikipedia.org/wiki/Pantheon,_Rome"),
        Location(
            name: "Trevi Fountain",
            cityName: "Rome",
            coordinates: CLLocationCoordinate2D(latitude: 41.9009, longitude: 12.4833),
            description: "The Trevi Fountain is a fountain in the Trevi district in Rome, Italy, designed by Italian architect Nicola Salvi and completed by Giuseppe Pannini and several others. Standing 26.3 metres high and 49.15 metres wide, it is the largest Baroque fountain in the city and one of the most famous fountains in the world.",
            imageNames: [
                "rome-trevifountain-1",
                "rome-trevifountain-2",
                "rome-trevifountain-3",
            ],
            link: "https://en.wikipedia.org/wiki/Trevi_Fountain"),
        Location(
            name: "Eiffel Tower",
            cityName: "Paris",
            coordinates: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945),
            description: "The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower. Locally nicknamed 'La dame de fer', it was constructed from 1887 to 1889 as the centerpiece of the 1889 World's Fair and was initially criticized by some of France's leading artists and intellectuals for its design, but it has become a global cultural icon of France and one of the most recognizable structures in the world.",
            imageNames: [
                "paris-eiffeltower-1",
                "paris-eiffeltower-2",
            ],
            link: "https://en.wikipedia.org/wiki/Eiffel_Tower"),
        Location(
            name: "Louvre Museum",
            cityName: "Paris",
            coordinates: CLLocationCoordinate2D(latitude: 48.8606, longitude: 2.3376),
            description: "The Louvre, or the Louvre Museum, is the world's most-visited museum and a historic monument in Paris, France. It is the home of some of the best-known works of art, including the Mona Lisa and the Venus de Milo. A central landmark of the city, it is located on the Right Bank of the Seine in the city's 1st arrondissement.",
            imageNames: [
                "paris-louvre-1",
                "paris-louvre-2",
                "paris-louvre-3",
            ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Berlin",
            cityName: "Germany",
            coordinates: CLLocationCoordinate2D(latitude: 52.5200, longitude: 13.4050),
            description: "Berlin, capital and chief urban centre of Germany. The city lies at the heart of the North German Plain, athwart an east-west commercial and geographic axis that helped make it the capital of the kingdom of Prussia and then, from 1871, of a unified Germany. Berlin’s former glory ended in 1945, but the city survived the destruction of World War II. It was rebuilt and came to show amazing economic and cultural growth.",
            imageNames: [
                "berlin-1",
                "berlin-2",
                "berlin-3",
            ],
            link: "https://en.wikipedia.org/wiki/Berlin"),
        Location(
            name: "Rovinj",
            cityName: "Croatia",
            coordinates: CLLocationCoordinate2D(latitude: 45.0812, longitude: 13.6387),
            description: "The old town stands on a headland, with houses tightly crowded down to the seafront. A tangle of cobbled streets leads to the hilltop church of St. Euphemia, whose towering steeple dominates the skyline. South of the old town is Lone Bay, one of the area’s pebble beaches. The Rovinj archipelago’s 14 islands lie immediately off the mainland.",
            imageNames: [
                "rovinj-1",
                "rovinj-2",
                "rovinj-3",
            ],
            link: "https://en.wikipedia.org/wiki/Rovinj"),
    ]
    
}
