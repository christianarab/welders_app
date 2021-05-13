class App
    def encrypt(string)
        return string.downcase
                .tr('aeiou', '_')
                .tr('bcdfgwhjklmnpvxyz', '*')
                .tr('qrst', '^')
                .tr('1234567890', '#')
    end
    
    def run(string)
        puts encrypt(string)
    end
end

app = App.new
app.run "Welders local 5898 we unite the people by melting their hearts"