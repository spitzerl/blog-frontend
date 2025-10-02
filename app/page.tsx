export default function Home() {
  return (
    <div className="min-h-screen bg-gray-50 dark:bg-gray-900">
      <div className="container mx-auto px-4 py-8">
        <header className="text-center mb-12">
          <h1 className="text-4xl md:text-6xl font-bold text-gray-900 dark:text-white mb-4">
            Mon Blog - Frontend
          </h1>
          <p className="text-lg text-gray-600 dark:text-gray-300 max-w-2xl mx-auto">
            Frontend séparé du monolith - Prêt à être connecté au backend API
          </p>
        </header>

        <main>
          <div className="text-center py-12">
            <h2 className="text-2xl font-semibold text-gray-700 dark:text-gray-300 mb-4">
              Service Frontend déployé avec succès
            </h2>
            <p className="text-gray-500 dark:text-gray-400 mb-4">
              Configurez NEXT_PUBLIC_API_URL pour connecter à votre API backend
            </p>
            <div className="bg-gray-100 dark:bg-gray-800 p-4 rounded-lg max-w-md mx-auto">
              <p className="text-sm text-gray-600 dark:text-gray-400">
                API URL: {process.env.NEXT_PUBLIC_API_URL || 'Non configurée'}
              </p>
            </div>
          </div>
        </main>

        <footer className="text-center mt-16 pt-8 border-t border-gray-200 dark:border-gray-700">
          <p className="text-gray-500 dark:text-gray-400">
            © 2024 Mon Blog - Architecture microservices
          </p>
        </footer>
      </div>
    </div>
  );
}
