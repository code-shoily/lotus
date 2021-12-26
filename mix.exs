defmodule Lotus.MixProject do
  use Mix.Project

  @version "0.0.1"

  def project do
    [
      app: :lotus,
      description: "A set of simple Surface components based on UIKit3.",
      version: @version,
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      compilers: Mix.compilers() ++ [:phoenix, :surface],
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:dev), do: ["lib"] ++ catalogues()
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp aliases do
    [
      dev: "run --no-halt dev.exs",
      format: ["format", "surface.format"]
    ]
  end

  def catalogues do
    [
      "priv/catalogue",
      "deps/surface/priv/catalogue"
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.6.0", only: [:dev, :test], runtime: false},
      {:esbuild, "~> 0.4", only: [:dev, :test]},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:floki, "~> 0.32.0", only: :test},
      {:jason, "~> 1.3"},
      {:surface, "~> 0.6"},
      {:surface_formatter, "~> 0.7", only: :dev},
      {:surface_catalogue, "~> 0.2", only: :dev}
    ]
  end
end
