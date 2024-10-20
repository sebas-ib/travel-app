import SwiftUI

struct SmallPlaceView: View {
    let itinerary: Itinerary
    
    var body: some View {
        ZStack {

            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.white)
                .frame(height: 100)
                .padding(.horizontal,20)
                .shadow(radius: 1)
            
            VStack {
                HStack{
                    Text(itinerary.name).font(.headline)
                        .padding() // Adds padding around the rectangle
                    Spacer() // Keeps the text at the top
                    
                    
                }.padding() // Adds padding around the HStack
                Spacer() // Keeps the text at the top

            }
        }
    }
}

struct SmallPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        SmallPlaceView(itinerary: .preview())
            .previewLayout(.sizeThatFits) // Adjusts the preview layout
            .padding() // Adds padding to the preview
    }
}
