use Croma

defmodule AntikytheraPractice.Gettext do
  use Antikythera.Gettext, otp_app: :antikythera_practice

  defun put_locale(locale :: v[String.t]) :: nil do
    Gettext.put_locale(__MODULE__, locale)
  end
end
