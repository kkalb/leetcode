defmodule Mix.Tasks.CreateProblem do
  @moduledoc "mix tasks.create_problem"
  use Mix.Task

  @shortdoc "asdasd"
  def run(args) when args == ["-h"] or args == ["--help"] do
    IO.puts(
      "First param is name of the new file without ending, like: mix create_problem problemname"
    )
  end

  def run([file_name] = _args) do
    if String.contains?(file_name, "."), do: IO.puts("Please do not use dots.")

    {full_file_name, full_test_file_name} = get_new_path(file_name)

    base_content_file = get_base_content(file_name)
    base_content_test_file = get_base_content_test(file_name)

    :ok = File.write(full_file_name, base_content_file)
    :ok = File.write(full_test_file_name, base_content_test_file)
  end

  def run(args) do
    IO.inspect(args, label: "Only filename as input is needed")
  end

  defp get_new_path(file_name) do
    base_folder = File.cwd!()

    full_file_name = Path.join([base_folder, "/lib/", file_name <> ".ex"])
    full_test_file_name = Path.join([base_folder, "/test/", file_name <> ".exs"])
    {full_file_name, full_test_file_name}
  end

  defp get_base_content(file_name) do
    file_name = Macro.camelize(file_name)

    """
    defmodule #{file_name} do
      @moduledoc \"\"\"

      URL

      DESCRIPTION
      \"\"\"
    end
    """
  end

  defp get_base_content_test(file_name) do
    file_name = Macro.camelize(file_name)

    """
    defmodule #{file_name <> "Test"} do
      use ExUnit.Case
      alias #{file_name}

      test "Case 1" do
        s = true
        t = false

        assert s and not t
      end

      test "Case 2" do
        s = true
        t = false

        refute not s and t
      end

    end

    """
  end
end
