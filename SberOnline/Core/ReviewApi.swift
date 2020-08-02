import Foundation // swiftlint:disable:this foundation_using

final class ReviewApiAssembly {
    static func assembleModule() -> ReviewApiProtocol {
        ReviewApi(networkService: NetworkService(urlString: "url типо"))
    }
}

protocol ReviewApiProtocol: AnyObject {
    func fetchReviews(completion: @escaping (Result<[Review], Error>) -> Void)
}

final class ReviewApi: ReviewApiProtocol {
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchReviews(completion: @escaping (Result<[Review], Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            completion(.success([
                Review(text: "очень плохо стало работать приложение последнее время половину операций из истории не показывает неправильно показывает баллы спасибо др проблемы раньше такого не было", team: "Развитие лояльности в МП СБОЛ, История операций", tags: [.defect, .bug]),
                Review(text: "мне кажется крупных компаний есть специальный отдел который портит интерфейс каждым обновлением они прям собираются обсуждают как бы нам сделать шикарное приложение бесящимся неудобным для клиентов ваши идеи сделать всё плоским как конкуренты года назад никштяк квадраты как винде огонь ещё ещё", team: "Design Team", tags: [.defect]),
                Review(text: "занимает очень много места удаление новая установка ничего не меняет долго загружается много рекламы картинок каждым обновлением все печальнее печальнее", team: "iOS Release Engineer", tags: [.defect]),
                Review(text: "после обновления стало писать что инфо по карте не актуально стало хуже", team: "iOS Platform", tags: [.defect]),
                Review(text: "это очень неудобно изменения автоплатежи подтверждать через звонок", team: "ЕФС.Автоплатежи", tags: [.wish, .defect]),
                Review(text: "зависает поиск по инннннннннннннн", team: "Редактируемый профиль клиента", tags: [.bug])
            ]))
        }
    }
}
