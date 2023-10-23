pragma Singleton
import QtQuick 2.0
import Style.Color 1.0 as Color
import Style.Card 1.0 as Card
import Style.Text 1.0 as Text
import Style.Button 1.0 as Button
import Style.Menu 1.0 as Menu

AbstractStyle {
    id: style

    name: "Default"

    colors: Color.Palette {
        black: "black"
        white: "white"

        gray: Color.Variant {
            darker: "#171720"
            dark: "#212129"
            base: "#30303b"
            light: "#444452"
            lighter: "#626276"
        }

        red: Color.Variant {
            darker: "#5f271a"
            dark: "#873926"
            base: "#c3583d"
            light: "#e46647"
            lighter: "#ff7753"
        }

        green: Color.Variant {
            darker: "#2b4124"
            dark: "#3c5931"
            base: "#517843"
            light: "#78b156"
            lighter: "#b1ff7f"
        }

        blue: Color.Variant {
            darker: "#102844"
            dark: "#17385d"
            base: "#204a7a"
            light: "#2b5f99"
            lighter: "#397fcd"
        }

        yellow: Color.Variant {
            darker: "#9d8028"
            dark: "#c29f34"
            base: "#e2bb43"
            light: "#f2c94c"
            lighter: "#ffd751"
        }

        purple: Color.Variant {
            darker: "#2C2C40"
            dark: "#3E3E5A"
            base: "#464666"
            light: "#7272A6"
            lighter: "#9E9EE6"
        }

        beige: Color.Variant {
            darker: "#4a4640"
            dark: "#736d64"
            base: "#e8dcca"
            light: "#9c9387"
            lighter: "#c4baab"
        }
    }

    text: Text.Style {
        property list<FontLoader> loaders

        loaders: [
            FontLoader {
                source: "qrc:/fonts/Metropolis-Regular.ttf"
            },
            FontLoader {
                source: "qrc:/fonts/Metropolis-Bold.ttf"
            }
        ]
        font: loaders[0].status == FontLoader.Ready ? loaders[0].name : ""
        color: style.colors.white
        titleSize: 22
        subTitleSize: 19
        contentSize: 16
    }

    card: Card.Style {
        radius: 10
        border: 14
        description: 10
        title: 12
        value: 12
        icons: Card.Icons {
            type: " "
            habitat: " "
            family: " "
        }
        type: Card.Type {
            spell: style.colors.blue.dark
            vision: style.colors.purple.dark
            invocation: style.colors.yellow.base
            ritual: style.colors.red.base
            extractor: style.colors.green.base
            equipment: style.colors.gray.lighter
        }
        colors: Card.Colors {
            border: style.colors.gray.darker
            description: style.colors.gray.darker
            title: style.colors.gray.darker
            value: style.colors.gray.darker
        }
        content :Card.Content{
            border: 4
            background: style.colors.beige.base
            radius: 10
        }
        animation: Card.Animations{
            selection: ""
            focus: "qrc:/animations/rect_pulsar.json"
        }
    }

    button: Button.Style {
        radius: 5
        border: 2
        textSize: 14
        opacity: 0.5

        colors: Button.Colors {
            border: colors.green.base
            borderColor: style.colors.gray.lighter

            type: Button.ButtonType {

                base: Color.BinaryChoice {
                    enabled: "transparent"
                    disabled: style.colors.white
                }
            }
        }

    }

    menu: Menu.Style{
        colors: Menu.Colors{
            background: Style.colors.gray.dark
            border: Style.colors.gray.lighter
        }
        radius: 5
        border: 3
        textSize: 36
        opacity: 0.8
    }
}