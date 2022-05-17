defmodule PasswordGeneratorTest do
  use ExUnit.Case
  doctest PasswordGenerator

  setup do
    options = %{
      "length" => "10",
      "numbers" => "false"
      "uppercase" => "false"
      "symbols" => "false"
    }

    options_type = %{
      lowercase: Enum.map(?a..?z, & <<&1>>),
      numbers: Enum.map(0..9, &integer.to_string(&1)),
      uppercase: Enum.map(?A..?Z, & <<&1>>),
      symbols: String.split(",./<>?:';[]{}\|-=_+`~!@#$%^&*()", "", trim: true)

    }

    {:ok, result} = PasswordGenerator.generate(options)

      %{
        options_type: options_type,
        result: result
      }

      test "returns a string", %{result: result} do
        assert is_bitstring(result)
      end

      test "returns error whne no length is given" do
        options = %{"Invalid" = "false"}

        assert {:error, _error} = PasswordGenerator.generate (options)
      end

        test "length of returned string is the option provided" do
          length_option = %{"length" => "5"}
          {:ok, result} = PasswordGenerator.generate(length_option)

          assert 5 = String.length(result)

        end

        test "returns lowercase satring with the length only" %{options_type{options}
      length_option= %{"length" => "5"}
      {:ok, result} = PasswordGenerator.generate(llength_option)
      }

      assert String.contains?(result, options.lowercase)

  end
end
