package main

import (
	"image/color"
	"log"
	"os"

	"gioui.org/app"
	"gioui.org/op"
	"gioui.org/text"
	"gioui.org/widget/material"
)

func main() {
	log.SetFlags(log.LstdFlags | log.Lshortfile)
	log.Printf("---------- pi4lite Opened ------------")
	go func() {
		os.Setenv("DISPLAY", ":0") // required for X11. Compile wit: go build --tags nowayland .
		// os.Setenv("WAYLAND_DISPLAY", "wayland-1") // required for wayland. Compile with: go build --tags nox11 .
		app.Size(800, 480) // I don't know if this would help in any way
		var w app.Window
		w.Option(app.Fullscreen.Option())

		if err := loop(&w); err != nil {
			log.Fatalf("FATAL failed to start loop: %v", err)
		}

		log.Printf("---------- pi4lite Closed ------------")
		os.Exit(0)
	}()
	app.Main()
}

func loop(w *app.Window) error {
	theme := material.NewTheme()
	var ops op.Ops
	for {
		switch e := w.Event().(type) {
		case app.DestroyEvent:
			return e.Err
		case app.FrameEvent:
			// This graphics context is used for managing the rendering state.
			gtx := app.NewContext(&ops, e)

			// Define an large label with an appropriate text:
			title := material.H2(theme, "EA7KIR Gio Test")

			// Change the color of the label.
			maroon := color.NRGBA{R: 127, G: 0, B: 0, A: 255}
			title.Color = maroon

			// Change the position of the label.
			title.Alignment = text.Middle

			// Draw the label to the graphics context.
			title.Layout(gtx)

			// Pass the drawing operations to the GPU.
			e.Frame(gtx.Ops)
		}
	}
}
